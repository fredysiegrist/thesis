ComputeNEC <- function(cds) {
  if(!(checkCDS(cds))) {stop("non valid CDS)", call.=FALSE)}
  else {
    cds <- tolower(cds)
    cod <- rep(0, times=64)
    names(cod) <- sapply(as.character(Tef$codons), reversecomplement)
    cod <- cod[c(-59, -60, -64)]
    aa <- rep(0, times=20)
    names(aa) <- levels(Tef[,1])[c(-16,-18)]
    cods <- count(s2c(cds), word = 3, by=3)
    cod[names(cod)] <- as.vector(cods[tolower(names(cod))])
    AA <- table(translate(s2c(cds)))
    aa[names(aa)] <- AA[a(names(aa))]
    NC <- rep(1, times=length(aa))
    names(NC) <- names(aa)
    Acods <- sapply(names(NC), function(i) sapply(as.character(Tef[,2]), reversecomplement)[Tef[,1]==i])
    contributors <- names(aa)[sapply(Acods, length)>1&aa>1]
    Nc <- sapply(contributors, function(i) {
     n <- sum(cod[unlist(Acods[i])])
     S <- sum(sapply(cod[unlist(Acods[i])], function(x) (x/n)^2))
     F <- (n*S-1) / (n-1)
     return(1/F)
     }
    )
    NC[contributors] <- Nc[contributors]
    return(sum(NC))
  }
}
