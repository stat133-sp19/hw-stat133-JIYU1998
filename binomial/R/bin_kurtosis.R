#' @title  binomial kurtosis
#' @description binomial kurtosis
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial kurtosis
#' @export
#' @examples
#' bin_kurtosis(2,.5)


bin_kurtosis = function(trials, prob) {
  if(check_trials(trials)&check_prob(prob)) {
    k = aux_kurtosis(trials, prob)
    return(k)
  } else {stop('invalid value')}
}
