#' @title  binomial mean
#' @description calculate binomial mean
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial mean
#' @export
#' @examples
#' bin_mean(2,.5)


bin_mean = function(trials, prob) {
  if(check_trials(trials)&check_prob(prob)) {
    m = aux_mean(trials, prob)
    return(m)
  } else {stop('invalid input')}
}





