# This function counts Kmers in a given string
#
# @param str A character vector
# @param k The k, or length of the kmer, you wish to count
# @returns This function should return a table of kmer counts,
# 		   indexed by kmer name
countKmers = function(str, k) {
  count_table = c()
  for (x in 1:(nchar(str)-k+1)) {
    kmer = substr(str, x, (x+k-1))
    if (kmer %in% names(count_table)){
      count_table[kmer] = count_table[kmer] + 1
    }
    else{
      count_table[kmer] = 1
    }
  }
  return (count_table)
}
