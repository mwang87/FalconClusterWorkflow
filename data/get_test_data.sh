wget -P test_data ftp://massive.ucsd.edu/MSV000084314/updates/2020-09-14_mwang87_13aa328e/peak/MGF/MSV000078547.mgf
cp test_data/MSV000078547.mgf test_data/MSV000078547_2.mgf
wget --output-document=./test_data/extracted_nina.mgf "https://proteomics2.ucsd.edu/ProteoSAFe/DownloadResultFile?task=35d69cc15cc74008bdd5046f2177eb5b&file=query_results/extracted/extracted.mgf&block=main&process_html=false"