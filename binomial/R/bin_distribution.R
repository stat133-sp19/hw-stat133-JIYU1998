#' @title bin_distribution
#' @description create dataframe of binomial distribution
#' @param trials nubmer of trials
#' @param prob probsbility of success
#' @return data.frame dataframe of binomial distribution
#' @export
#' @examples
#' bin_distribution(2,.5)
#'   \dontrun{
#'  # plot the distribution
#'  dis = bin_distribution(2,.5)
#'
#'  plot(dis)
#'  }

bin_distribution = function(trials,prob) {
  dat = data.frame(
    success = 0:trials,
    probability = bin_probability(0:trials, trials, prob)
  )
  class(dat) = c('bindis','data.frame')
  return(dat)
}

#' @export
plot.bindis = function(bindis) {
  barplot(bindis[,2],names.arg = bindis[,1])
}






