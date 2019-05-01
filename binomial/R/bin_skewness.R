#' @title  binomial skewness
#' @description binomial skewness
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial skewness
#' @export
#' @examples
#' bin_skewness(2,.5)



bin_skewness = function(trials, prob) {
  if(check_trials(trials)&check_prob(prob)) {
    s = aux_skewness(trials, prob)
    return(s)
  } else {stop('invalid value')}
}
