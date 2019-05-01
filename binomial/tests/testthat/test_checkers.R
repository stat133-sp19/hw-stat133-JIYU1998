context('test check_functions')

test_that('check_prob',{
  expect_true(check_prob(0))
  expect_error(check_prob(c(0,0.1)))
  expect_error(check_prob('a'))
  
}
         )

test_that('check_trial',{
  expect_error(check_trials(-1))
  expect_error(check_trials(c(0,0.1)))
  expect_error(check_trials('a'))
  
}
)

test_that('check_success',{
  expect_error(check_success(c(1,2),1))
  expect_error(check_success(1,1.2))
  expect_error(check_prob('a'))
  
}
)

