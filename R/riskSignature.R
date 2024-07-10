#EFS24 Signature Test
#' @export
riskSignature = function(expr_input,use_background=T) {
  
  if(unlist(table(rownames(expr_input)%in%riskgenes$gene))[[2]][1]==0){#check to see if any genes are present
    print("No signature genes found.")
  }
  
  sig_up = riskgenes$gene[which(riskgenes$direction=="up")] # upregulated genes
  sig_down = riskgenes$gene[which(riskgenes$direction=="down")] # downregulated genes
  
  print(c("# of genes input:",(nrow(expr_input))))
  if(use_background){
    expr_input = subset(expr_input,rownames(expr_input)%in%background$EnsemblID)
  }
  print(c("# of genes analyzed:",as.numeric(nrow(expr_input))))
  
  rankData = singscore::rankGenes(expr_input)
  scoredf = singscore::simpleScore(rankData,upSet = sig_up,downSet = sig_down)

  #hard-coded totalscore cutpoints for single-sample testing
  #if input is a representative population, the alternative is to use SD(scale(scoredf$TotalScore)>=1 and SD(scale(scoredf$TotalScore)<=-1
  scoredf$RiskClassification = ifelse(scoredf$TotalScore >= .1818,"high_risk",ifelse(scoredf$TotalScore <= .0609,"low_risk","intermediate_risk"))
  return(scoredf)
}
