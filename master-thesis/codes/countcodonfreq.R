countcodonfreq <- function(no=1, wdir="/windows/R/") {
    require(seqinr)
    list(myseq, myaa) <- mylist(wdir)
    print(length(myseq[[no]])/3/length(myaa[[attr(myseq[[no]], "name")]]))
}
