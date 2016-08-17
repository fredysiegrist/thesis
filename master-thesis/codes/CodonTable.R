require(statanacoseq)
require(seqinr)
verified <- mylist("/windows/R/Round3.all.maker.transcripts.verified.fasta", "/windows/R/Round3.all.maker.proteins.verified.fasta", whatout=1)
#CodonUsage(unlist(verified))
#uco(unlist(verified), 0, "eff")
tabl <- uco(verified[[1]], 1, "eff")
for (n in 2:length(verified)) { 
 tabl <- tabl + uco(verified[[n]], 1, "eff")
}

tabl <- uco(verified[[1]], 1, "eff")
for (n in 2:10000) { #length(verified)
 tabl <- tabl + uco(verified[[n]], 1, "eff")
}


tabl1 <- uco(verified[[10001]], 1, "eff")
for (n in 10002:20000) { 
 tabl <- tabl + uco(verified[[n]], 1, "eff")
}

tabl2 <- uco(verified[[20001]], 1, "eff")
for (n in 20002:30000) { 
 tabl <- tabl + uco(verified[[n]], 1, "eff")
}

tabl3 <- uco(verified[[30001]], 1, "eff")
for (n in 30002:41988) { 
 tabl <- tabl + uco(verified[[n]], 1, "eff")
}

tabla <- tabl+tabl1+tabl2+tabl3
perc <- round(tabla/nuu*100,2)




