% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{a_t_two}
\alias{a_t_two}
\alias{a_t_two_cum}
\alias{A_t_inv_two}
\title{Compute divergence function}
\usage{
a_t_two(c, t)

a_t_two_cum(c, t)

A_t_inv_two(c, y)
}
\arguments{
\item{c}{a positive number for the divergence hyperparameter. A larger value implies
earlier divergence on the tree}

\item{t}{a number in the interval (0, 1) indicating the divergence time}

\item{y}{a positive number to take inverse}
}
\value{
The value and cumulative hazard return a positive number. The inverse function returns a number in the interval (0, 1).
}
\description{
Compute value, cumulative hazard, and inverse for divergence function \eqn{a(t) = c / (1-t)^2}
}
\section{Functions}{
\itemize{
\item \code{a_t_two()}: value of the divergence function

\item \code{a_t_two_cum()}: cumulative hazard function

\item \code{A_t_inv_two()}: inverse function

}}
\examples{
a_t_two(1, 0.5)
a_t_two_cum(1, 0.5)
A_t_inv_two(1, 2)
}
\seealso{
Other divergence functions: 
\code{\link{a_t_one}()}
}
\concept{divergence functions}
