% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{div_time}
\alias{div_time}
\title{Sample divergence time on an edge uv previously traversed by m(v) data points}
\usage{
div_time(t_u, m_v, c, c_order = 1, alpha = 0, theta = 0)
}
\arguments{
\item{t_u}{a number in the interval (0, 1) indicating the divergence time at node u}

\item{m_v}{an integer for the number of data points traversed through node v}

\item{c}{a positive number for the divergence hyperparameter. A larger value implies
earlier divergence on the tree}

\item{c_order}{equals 1 if using divergence function \eqn{a(t) = c / (1-t)}, or 2 if
a(t) = c / (1-t)^2. Default is 1}

\item{alpha, theta}{hyparameter of branching probability a(t) Gamma(m-alpha) / Gamma(m+1+theta)
For DDT, alpha = theta = 0. For general multifurcating tree from a Pitman-Yor process,
specify positive values to alpha and theta. It is, however, recommended using alpha =
theta = 0 in inference because multifurcating trees have not been tested rigorously.}
}
\value{
a number in the interval (0, 1)
}
\description{
Sample divergence time on an edge uv previously traversed by m(v) data points
}
