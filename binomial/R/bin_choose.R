#' @title binomial choose
#' @description calculates number of combinations in which k successes occur in n trials
#' @param n number of trials
#' @param k number of success
#' @return number of combinations of k successes occuring in n trials
#' @export
#' @examples
#' bin_choose(5,2)
bin_choose = function(n,k) {
  if(sum(k > n)>0){stop("k cannot be greater than n")}
  else{
    l = length(k)
    n = rep(n,l)
    f = c(factorial(n[1:l])/factorial(k[1:l])/factorial(n[1:l]-k[1:l]))
    return(f)}

}







