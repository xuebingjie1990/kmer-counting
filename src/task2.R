library("seqinr")
library("plyr")
library("ggfortify")
library("ggplot2")

setwd("~/Documents/Courses/BIMS8601/kmer-counting")
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
      seq = seq[1]
      counts = countKmers(seq, 4)
      matrix = rbind.fill(matrix, data.frame(as.list(counts)) )
    }
  }
  matrix[is.na(matrix)] = 0
  return  (matrix) 
}

matrix = kmersCountMatrix("~/Documents/Courses/BIMS8601/kmer-counting/fasta/")
pc <- prcomp(matrix,
             center = TRUE,
             scale. = TRUE)
# plot with ggplot2::autoplot
p <- autoplot(pc)
p
# plot with ggplot
p2 <- ggplot(pc, aes(x=PC1, y=PC2)) + geom_point()
p2

