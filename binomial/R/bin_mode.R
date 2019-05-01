#' @title  binomial mode
#' @description binomial mode
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial mode
#' @export
#' @examples
#' bin_mode(2,.5)


bin_mode = function(trials, prob) {
  if(check_trials(trials)&check_prob(prob)) {
    m = aux_mode(trials, prob)
    return(m)
  } else {stop('invalid value')}
}
