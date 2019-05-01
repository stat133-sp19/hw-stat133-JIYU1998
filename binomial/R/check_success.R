# Titel: Check success
# Description: check whether number of success is valid
# Input
#  trials: number of trials
#  success: number of success
# Output
#  True or False
check_success = function(success, trials) {
  if(sum(success>trials)>0|trials%%1!=0|sum(success%%1==0)!=length(success)) {stop('invalid success value')}
  else {
    return(T)
  }
}
