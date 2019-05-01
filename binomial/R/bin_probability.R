#' @title binomial probability
#' @description binomial probability
#' @param success number of success
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial probability
#' @export
#' @examples
#' bin_probability(1,2,.5)

bin_probability = function(success, trials, prob) {
 if(check_trials(trials)!=T) {stop('invalid trials value')}
  else if(check_prob(prob)!=T) {stop('invalid probability value')}
  else if(check_success(success,trials)!=T) {stop('invalid success value')}
  else {
    p = bin_choose(trials, success)*prob^success*(1-prob)^(trials-success)
    return(p)
      }
}
