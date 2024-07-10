This R package contains a function and data to reproduce the risk signature from, Multiomic Analysis Identifies a High-Risk Metabolic and TME Depleted Signature that Predicts Early Clinical Failure in DLBCL. https://doi.org/10.1101/2023.06.07.23290748

Description

"riskSignature.R" defines a workflow to reproduce risk signature classifications from the publication. The input required is a normalized bulk-RNAseq expression profile. It is suggested to length-normalize the input with TPM. Input data must be formatted with row names as ensemblID and column names as sampleID. To generate the score, this workflow implements R package SingScore. Normalized mean-rank scores are generated from a pair of up- and down-regulated genesets associated with progression risk. Additionally, a list of background genes are provided. An option, "use_background" is implemented to include the "gene_background", which is the set of attributes included in the original risk score generation. When set to TRUE, the input dataset is subset to contain only genes present in the training dataset. 

Included

1. riskSignature.R - R function which returns a data frame of score information and risk classification
2. riskgenes - Table consisting of RNA risk signature genes and direction
3. background - Table consisting of a "universe" of genes analyzed during model training

Usage

```
#get package from github
library(remotes)
remotes::install_github("NovakLab/RiskSignature")
library(RiskSignature)

#load expression profile
normalized_expression = read.csv("PATH/TO/EXPRESSION.csv")

#perform classification
risk_classifications = riskSignature(expr_input=normalized_expression,use_background = T)
```
This package depends on R version >= 3.5.0

