# Title: Check probability
# Description: check whether a probability is valid
# Input
#  prob: probability
# Output
#  True or False


check_prob = function(prob) {
  if(length(prob)!=1) {stop('length of probability should be 1')}
  else if(prob>=0&prob<=1) {
    return(T)
  }

  else {stop('invalid prob value')}
}

















