#' @title  binomial variance
#' @description binomial variance
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial variance
#' @export
#' @examples
#' bin_variance(2,.5)


bin_variance = function(trials, prob) {
  if(check_trials(trials)&check_prob(prob)) {
    v = aux_variance(trials, prob)
    return(v)
  } else {stop('invalid value')}
}
