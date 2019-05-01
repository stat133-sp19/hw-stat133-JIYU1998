
# Title: skewness
# Description: calculate skewness
# Input
#  trials: number of trials
#  prob: probability of success
# Output
#  skewness: skewness of success
aux_skewness = function(trials, prob) {
  s = (1-2*prob)/sqrt(trials*prob*(1-prob))
  return(s)
}
