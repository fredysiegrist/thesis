#03.01.2016 Master project read in stat files from view-source:http://gtrnadb.ucsc.edu/GtRNAdb2/genomes/eukaryota/

#reading the files
setwd("E:/R")
readstats <- function(fileno=2, chunksize=1) {
  statfile=dir(pattern=".stats$")[fileno]
  con <- file(statfile, "r", blocking = FALSE) 
  for(i in seq(1,3500,chunksize)){
	    d=scan(con,what="a",nlines=chunksize,sep="|", quote="",quiet=TRUE)
	if (length(d)>0 && d[1]==""){
	  print(substr(d[2:(length(d)-1)], 2, 15) )
	  reps <- as.numeric(gsub("[^0-9]","", d[2:(length(d)-1)]))
	  tRNAs <- substr(d[2:(length(d)-1)], 2, 4)
	  codons <- substr(d[2:(length(d)-1)], 6, 8)
		closeAllConnections()
	  return(data.frame(tRNAs, codons, reps))
	}
  }
}
(Zmays <- readstats() )
eins <- function(x=c("Val","UUU","1")){optfactor <- as.numeric(x[3])/max(Zmays[tRNAs==x[1],3])}
optfact <- apply(Zmays, 1, eins)
isopt <- (optfact == 1)
Zmays.out <- data.frame(Zmays, optfact, isopt)
Zmays.out[Zmays.out$isopt==TRUE,-4]
