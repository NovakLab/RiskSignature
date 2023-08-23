This R package contains a function and data to reproduce the RNA Risk Signature from, Multiomic Analysis Identifies a High-Risk Metabolic and TME Depleted Signature that Predicts Early Clinical Failure in DLBCL. https://doi.org/10.1101/2023.06.07.23290748

Description

“riskSignature.R” defines a workflow to reproduce Risk Signature classifications from the publication. Input required is a normalized RNAseq expression. Input data must be formatted with row names as ensemblID and column names as sampleID. It is suggested to length-normalize the input expression with log2(TPM+1). To generate the score, this workflow implements R package SingScore. An up-regulated geneset and a down-regulated geneset of risk associated features along with a list of background genes are provided. An option is provided to include the “gene_background”. This is the set of attributes included in the original risk score generation.  When set to True the input dataset is subset to contain only genes which are also present in the training dataset. 

Included

1. riskSignature.R - R function which returns a dataframe of score information and risk classification

2. riskgenes - Table consisting of RNA risk signature genes and direction

3. background - Table consisting of a "universe" of genes analyzed during model training
