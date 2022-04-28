library(seqinr)
source("src/countKmers.R")

loadSeq = function(path) {
  return (read.fasta(path, as.string=TRUE))
}

readFile = function(path){
  filepath = c()
  filenames <- list.files(path, pattern="*.fa")
  for( f in filenames){
    filepath = c(filepath, paste0(path, f))
  }
  return (filepath)
}

kmersCountMatrix = function(path){
  matrix = data.frame()
  for (f in readFile(path)){
    for (seq in loadSeq(f)){
      seqname = attr(seq, "name")
      seq = seq[1]
      if (!(seqname %in% row.names(matrix))){
        counts = countKmers(seq, 4)
        matrix = rbind(matrix, counts )
        row.names(matrix)[length(row.names(matrix))] = seqname
      }
    }
  }
  return  (matrix) 
}

matrix = kmersCountMatrix("~/Documents/Courses/BIMS8601/kmer-counting/fasta/")


