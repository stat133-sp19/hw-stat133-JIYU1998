# Title: mode
# Description: calculate mode
# Input
#  trials: number of trials
#  prob: probability of success
# Output
#  mode: mode of success
aux_mode = function(trials, prob) {
  n = trials
  p = prob
  if((n*p+p)%%1==0) {
    m = n*p+p
    mode = c(m,m-1)
    return(mode)
  }
  if((n*p+p)%%1!=0) {
    m = n*p+p-((n*p+p)%%1)
    return(m)
  }
}
