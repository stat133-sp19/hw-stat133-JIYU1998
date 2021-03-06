# Title: kurtosis
# Description: calculate kurtosis
# Input
#  trials: number of trials
#  prob: probability of success
# Output
#  kurtosis: kurtosis of success
aux_kurtosis = function(trials, prob) {
  k = (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  return(k)
}
