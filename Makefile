run_test:
	rm falcon_test* || true
	falcon data/test_data/*.mgf falcon_test --export_representatives --precursor_tol 20 ppm --fragment_tol 0.05 --eps 0.10 --work_dir cluster_work --overwrite

run_all:
	rm all_data* || true
	falcon data/all_data/*.mgf all_data --export_representatives --precursor_tol 2 Da --fragment_tol 0.5 --eps 0.10 --work_dir cluster_work --overwrite
