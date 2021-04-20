run:
	falcon data/data/*.mgf falcon --export_representatives --precursor_tol 20 ppm --fragment_tol 0.05 --eps 0.10 --work_dir cluster_work
