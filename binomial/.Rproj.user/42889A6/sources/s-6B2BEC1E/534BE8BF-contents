#' @title  binomial cumulative
#' @description create a dataframe of cumulative probability of success
#' @param trials number of trials
#' @param prob probability of success
#' @return dataframe of cumulative probability of success
#' @export
#' @examples
#' bin_cumulative(2,.5)
#'   \dontrun{
#'  # plot the cumulative probability
#'  cum = bin_cumulative(2,.5)
#'
#'  plot(cum)
#'  }

bin_cumulative = function(trials, prob) {
  dat = data.frame(
    success = 0:trials,
    probability = bin_probability(0:trials, trials, prob),
    cumulative = cumsum(bin_probability(0:trials, trials, prob))
  )
  class(dat) = c('bincum','data.frame')
  return(dat)
}

#'@export
plot.bincum = function(bincum) {
  plot(x = bincum[,1],y = bincum[,3],type = 'l',xlab = 'successes',ylab = 'probability')
  points(x = bincum[,1],y = bincum[,3])
}














