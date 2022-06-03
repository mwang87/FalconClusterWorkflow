#!/usr/bin/env nextflow

params.input_spectra = '../data/test_data/AH22.mzML'
params.eps = "0.01"
params.mincluster = "2"

_mzML_ch = Channel.fromPath(params.input_spectra + "/**/*.mzML")
_mzml_ch = Channel.fromPath(params.input_spectra + "/**/*.mzml")
_mzXML_ch = Channel.fromPath(params.input_spectra + "/**/*.mzXML")
_mzxml_ch = Channel.fromPath(params.input_spectra + "/**/*.mzxml")
_mgf_ch = Channel.fromPath(params.input_spectra + "/**/*.mgf")
_MGF_ch = Channel.fromPath(params.input_spectra + "/**/*.MGF")


_spectra_ch = Channel.empty()
_spectra_ch = _spectra_ch.concat(_mzXML_ch)
_spectra_ch = _spectra_ch.concat(_mzxml_ch)
_spectra_ch = _spectra_ch.concat(_mzML_ch)
_spectra_ch = _spectra_ch.concat(_mzml_ch)
_spectra_ch = _spectra_ch.concat(_mgf_ch)
_spectra_ch = _spectra_ch.concat(_MGF_ch)

TOOL_FOLDER = "$baseDir/bin"
params.publishdir = "nf_output"

process clusterData {
    echo true
    
    publishDir "$params.publishdir", mode: 'copy'
    
    input:
    file "input_spectra/*" from _spectra_ch.collect()

    output:
    file "clustered_result.csv" into _cluster_info_ch
    file "clustered_result.mgf" into _cluster_mgf_ch

    """
        falcon  \
        input_spectra/* \
        clustered_result --export_representatives \
        --precursor_tol 0.05 Da \
        --fragment_tol 0.05 \
        --min_mz_range 0 \
        --min_mz 0 \
        --max_mz 2000 \
        --min_samples $params.mincluster \
        --eps $params.eps --work_dir cluster_work \
        --overwrite
    """
}

// Summarizing the output
process summarizeData {
    echo true
    cache false
    
    publishDir "$params.publishdir", mode: 'copy'
    
    input:
    file cluster_summary from _cluster_info_ch
    file cluster_mgf from _cluster_mgf_ch

    output:
    file "output_summary"

    """
    mkdir output_summary
    python $TOOL_FOLDER/summarize_results.py \
        $cluster_summary \
        output_summary
    """
}
