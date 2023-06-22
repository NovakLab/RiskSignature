# RiskSignature
This repository contains code and data to reproduce the RNA Risk Signature from, _Multiomic Analysis Identifies a High-Risk Metabolic and TME Depleted Signature that Predicts Early Clinical Failure in DLBCL_. https://doi.org/10.1101/2023.06.07.23290748

__Included__

1. DLBCL_risk_signature_test.R - R script to reproduce groups (“Low Risk“, “Intermediate Risk”, and “High Risk”)

2. ndDLBCL_log2TPM+1.csv - Example RNAseq data from paper

3. risk_signature_genes.csv - Table consisting of RNA risk signature genes and direction

__Description__

“DLBCL_risk_signature_test.R” defines a workflow to reproduce RNAsig classifications from the publication. Inputs required are normalized RNAseq expression, an up-regulated geneset, and a down-regulated geneset. Expression data must be formatted with row names ensemblIDs and column names sampleIDs. Provided RNAseq data is log2(TPM+1) transformed. Provided geneset data includes direction. All of the items are available to reproduce results from the paper. However, users may explore the use of this tool on other datasets. In that case, an option is provided to include the “gene background”. This is the set of attributes included in the original risk score generation.  When set to true the input dataset is subset to contain only genes which are also present in the training dataset. 
