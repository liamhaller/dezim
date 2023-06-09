% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conditional_functions.R
\name{conditional_mean}
\alias{conditional_mean}
\title{Calculate conditional means}
\usage{
conditional_mean(data, mean_var, category_var)
}
\arguments{
\item{data}{Dataframe that contains both \code{mean_var} and \code{category_var}}

\item{mean_var}{Data that will be used in the calculation of means}

\item{category_var}{The categories across which the function will compute means}
}
\value{
a dataframe with the means of \code{mean_var} for each level of \code{category_var}
}
\description{
\code{conditional_mean()} calculates the mean of \code{mean_var} conditional on the levels of \code{category_var}
}
