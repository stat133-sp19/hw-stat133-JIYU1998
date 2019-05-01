#' @title  binomial variable
#' @description generate a list of binomial random objects
#' @param trials number of trials
#' @param prob probability of success
#' @return a list of binomial random objects
#' @export
#' @examples
#' bin_variable(2,.5)
#' summary(bin_variable(2,.5))



bin_variable = function(trials, prob) {
  if(sum(check_prob(prob)+check_trials(trials))==2) {
    l = list(
      trials = trials,
      prob = prob
    )
    class(l) = 'binvar'
    return(l)
  }
  else {stop('in valid trials or prob')}
}

#' @export
print.binvar = function(dat) {
  cat('"Binomial variable"\n\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials: %s\n',dat[[1]]))
  cat(sprintf('- prob of success : %s',dat[[2]]))
  invisible(dat)
}



#' @export
summary.binvar = function(dat) {
  n = dat[[1]]
  p = dat[[2]]
  l = list(
    trials = n,
    prob = p,
    mean = aux_mean(n,p),
    variance = aux_variance(n,p),
    mode = aux_mode(n,p),
    skewness = aux_skewness(n,p),
    kurtosis = aux_kurtosis(n,p)
  )
  class(l) = 'summary.binvar'
  return(l)
}

#' @export
print.summary.binvar = function(dat) {
  l = summary.binvar(dat)
  n = l[[1]]
  p = l[[2]]
  cat('"Summary Binomial"\n\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials: %s\n',n))
  cat(sprintf('- prob of success : %s\n\n',p))
  cat('Measures\n')
  cat(sprintf('- mean    : %s\n',l[[3]]))
  cat(sprintf('- variance: %s\n',l[[4]]))
  cat(sprintf('- mode    : %s\n',l[[5]]))
  cat(sprintf('- skewness: %s\n',l[[6]]))
  cat(sprintf('- kurtosis: %s\n',l[[7]]))
  invisible(dat)
}





