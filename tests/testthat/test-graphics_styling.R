


test_that("surveyexplorer working alone", {
  berlinbears <- surveyexplorer::berlinbears
  expect_no_error(
    surveyexplorer::matrix_table(berlinbears, dplyr::starts_with('p_'))
  )
})

test_that("dezim_style", {
  berlinbears <- surveyexplorer::berlinbears
  expect_no_error(
    surveyexplorer::matrix_table(berlinbears, dplyr::starts_with('p_')) + dezim_style()
  )
})

test_that("dezim_colors", {
  berlinbears <- surveyexplorer::berlinbears
  expect_no_error(
    surveyexplorer::matrix_freq(berlinbears, dplyr::starts_with('p_')) +
      dezim_style() +
      ggplot2::scale_fill_manual(values = dezim_colors)
  )
})



