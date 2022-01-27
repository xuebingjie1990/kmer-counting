# This function should add an element to your bloom filter
#
# @param element 	Element you want to add
# @param filter	 	Filter to add the element to
# @return vector	Filter after adding the element
addElement = function(element, filter=bfilt) {

	# Hint: This function should call hashElement()

}

# Tests a filter to see if it contains an element
#
# @param element 	Element you want to add
# @param filter	 	Filter to add the element to
# @return bool		TRUE/FALSE indicating element exists
testElement = function(element, filter=bfilt) {


}

# Removes all elements from a filter
#
# @param filter	 	Filter to reset
# @return vector	Bloom filter vector
resetFilter = function(filter=bfilt) {

	# Hint: A bloom filter with no elements will be all 0s
}

# Compute hash values for a given element
#
# This is the workhorse of the Bloom Filter. Your hashElement
# function should be able to return a user-specified number of hash
# values. 
#
# @param element	Element to hash
# @param size		Length of vector of the filter
# @param hashes		Number of hash values to return
# @return vector[numeric]	A vector of length `hashes` that
# 	with each value less than `size`.
hashElement = function(element, size=10000, hashes=3) {

}

