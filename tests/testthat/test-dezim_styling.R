


test_that("dezim style", {

  mtcars$gear <- as.factor(mtcars$gear)

  p1 <- ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, colour = gear)) +
    labs(
      x = "Weight (1000 lbs)",
      y = "Fuel economy (mpg)",
      colour = "Gears"
    )
  expect_no_error(


    p1    + dezim_style()


  )
})









