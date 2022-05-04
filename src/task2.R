library("seqinr")
# library("ggfortify")
library("plyr")
library("plotly")
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
      seqname = attr(seq, "name")
      seq = seq[1]
      if (!(seqname %in% row.names(matrix))){
        counts = countKmers(seq, 4)
        rname = rownames(matrix)
        matrix = rbind.fill(matrix, data.frame(as.list(counts)) )
        rownames(matrix) = c(rname, seqname)
      }
    }
  }
  matrix[is.na(matrix)] = 0
  return  (matrix) 
}

matrix = kmersCountMatrix("~/Documents/Courses/BIMS8601/kmer-counting/fasta/")
pc <- prcomp(matrix,
             center = TRUE,
             scale. = TRUE)

# p <- autoplot(pc)
# ggplotly(p)

p2 <- ggplot(pc, aes(x=PC1, y=PC2)) + geom_point()
ggplotly(p2)

