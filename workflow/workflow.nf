#!/usr/bin/env nextflow

params.input_spectra = '../data/test_data/AH22.mzML'

_spectra_ch = Channel.fromPath( params.input_spectra )

TOOL_FOLDER = "$baseDir/bin"
params.publishdir = "nf_output"

process clusterData {
    echo true
    
    publishDir "$params.publishdir", mode: 'copy'
    
    input:
    file(input_spectrum) from _spectra_ch

    output:
    file "clustered_result*" into _results_ch

    """
        falcon  \
        $input_spectrum \
        clustered_result --export_representatives \
        --precursor_tol 0.05 Da \
        --fragment_tol 0.05 \
        --eps 0.10 --work_dir cluster_work \
        --overwrite
    """
}

// // Summarizing the output
// process summarizeData {
//     echo true
    
//     publishDir "$params.publishdir", mode: 'copy'
    
//     input:
//     input_files from _results_ch

//     output:
//     //file "clustered_result*"

//     """
//         python $TOOL_FOLDER/summarize_results.py
//     """
// }
