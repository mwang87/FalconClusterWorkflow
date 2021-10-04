## Environment Setup

On the GNPS side, to get everything set up for this template workflow, need a few steps:

Installing Conda Enviornment

```
conda create -n falconcluster python=3.9
```

Installing dependencies

```
conda install -n falconcluster -c bioconda nextflow
conda activate falconcluster 
pip install -r requirements.txt
```