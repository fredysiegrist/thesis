require(statanacoseq)
require(seqinr)
verified <- mylist("/windows/R/Round3.all.maker.transcripts.verified.fasta", "/windows/R/Round3.all.maker.proteins.verified.fasta", whatout=1)
# the process is killed when using to many sequences, so it is divided in four parts and added together later
tabl <- uco(verified[[1]], 0, "eff")
for (n in 2:10000) { #length(verified)
 tabl <- tabl + uco(verified[[n]], 0, "eff")
}
tabl1 <- uco(verified[[10001]], 0, "eff")
for (n in 10002:20000) { 
 tabl1 <- tabl + uco(verified[[n]], 0, "eff")
}
tabl2 <- uco(verified[[20001]], 0, "eff")
for (n in 20002:30000) { 
 tabl2 <- tabl + uco(verified[[n]], 0, "eff")
}
tabl3 <- uco(verified[[30001]], 0, "eff")
for (n in 30002:41988) { 
 tabl3 <- tabl + uco(verified[[n]], 0, "eff")
}
tabla <- tabl+tabl1+tabl2+tabl3
perc <- round(tabla/nuu*100,2)
(rbind(tabla, perc))


