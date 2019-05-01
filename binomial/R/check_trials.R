# Title: Check trials
# Description: check whether number of trials is valid
# Input
#  trials: number of trials
# Output
#  True or False
check_trials = function(trials) {
  if(length(trials)!=1) {stop('length of trials should be 1')}
  else if((trials%%1==0)&(trials>=0)){
    return(T)
  } else {stop('invalid trials value')}
}
