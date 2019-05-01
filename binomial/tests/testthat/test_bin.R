context('test summary functions')

test_that('bin_choose',{
  expect_equal(bin_choose(5,2),10)
  expect_equal(typeof(bin_choose(5,2)),'double')
  expect_error(bin_choose(2,5))
}
)

test_that('bin_probability',{
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5),c(0.03125,0.15625,0.31250))
  expect_equal(typeof(bin_probability(success = 2, trials = 5, prob = 0.5)),'double')
  expect_error(bin_probability('a'))
  expect_error(bin_probability(success = 0:5, trials = 2, prob = 0.5))
}
)

test_that('bin_distribution',{
  expect_equal(typeof(bin_distribution(2,.5)),'list')
  expect_error(bin_distribution(2,1.1))
  expect_equal(bin_distribution(1,.5)[[2]],c(.5,.5))
}
)

test_that('bin_cumulative',{
  expect_equal(typeof(bin_cumulative(2,.5)),'list')
  expect_error(bin_cumulative(2,1.1))
  expect_equal(bin_cumulative(1,.5)[[3]],c(.5,1.0))
}
)

