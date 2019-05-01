context('test summary functions')

test_that('aux_mean',{
  expect_equal(aux_mean(1,0),0)
  expect_equal(typeof(aux_mean(1,1)),'double')
  expect_error(aux_mean('a'))
  expect_equal(aux_mean(10, 0.3),3)
}
)


test_that('aux_variance',{
  expect_equal(aux_variance(10,0.3),2.1)
  expect_equal(typeof(aux_variance(10,.3)),'double')
  expect_error(aux_variance('a'))
  
}
)

test_that('aux_mode',{
  expect_equal(aux_mode(10,0.3),3)
  expect_equal(typeof(aux_mode(10,.3)),'double')
  expect_error(aux_mode('a'))
  
}
)

test_that('aux_skewness',{
  expect_equal(aux_skewness(10,0.3),(1-2*.3)/sqrt(10*.3*(1-0.3)))
  expect_equal(typeof(aux_skewness(10,.3)),'double')
  expect_error(aux_skewness('a'))
  
}
)

test_that('aux_kurtosis',{
  expect_equal(aux_kurtosis(10,0.3),(1-6*.3*(1-0.3))/(10*.3*(1-0.3)))
  expect_equal(typeof(aux_kurtosis(10,.3)),'double')
  expect_error(aux_kurtosis('a'))
  
}
)





