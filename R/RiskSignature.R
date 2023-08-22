#EFS24 Signature Test
#' @export
riskSignature = function(expr_input,use_background=F) {
  
  if(max(expr_input)>50 | min(expr_input)<0){#check to see if data is log2 transformed
    print("Check if data is log2+1 transformed.")
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
  scoredf$RiskClassification = as.vector(scale(scoredf$TotalScore))
  scoredf$RiskClassification = ifelse(scoredf$RiskClassification >= 1,"high_risk",ifelse(scoredf$RiskClassification <= -1,"low_risk","intermediate_risk"))
  return(scoredf)
}

#contact: novak.joseph@mayo.edu

