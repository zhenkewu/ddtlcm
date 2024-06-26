% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Gibbs_lcm.R
\name{sample_leaf_locations_pg}
\alias{sample_leaf_locations_pg}
\title{Sample the leaf locations and Polya-Gamma auxilliary variables}
\usage{
sample_leaf_locations_pg(
  item_membership_list,
  dist_mat_old,
  Sigma_by_group,
  pg_mat,
  a_pg,
  auxiliary_mat,
  auxiliary_mat_range,
  class_assignments
)
}
\arguments{
\item{item_membership_list}{a vector of G elements, each indicating the number of
items in this group}

\item{dist_mat_old}{a list of leaf covariance matrix from the previous iteration. The list
has length G, the number of item groups}

\item{Sigma_by_group}{a vector of length G, each denoting the variance of the
brownian motion}

\item{pg_mat}{a K by J matrix of PG variables from the previous iteration}

\item{a_pg}{a N by J matrix of hyperparameters of the generalized logistic distribution}

\item{auxiliary_mat}{a N by J matrix of truncated normal variables from previous iteration}

\item{auxiliary_mat_range}{a list of two named elements: lb and ub. Each is an N by J
matrix of the lower/upper bounds of the truncated normal variables.}

\item{class_assignments}{an integer vector of length N for the individual class assignments.
Each element takes value in 1, ..., K.}
}
\value{
a named list of three matrices: the newly sampled leaf parameters, the Polya-gamma random variables,
and the auxiliary truncated normal variables
}
\description{
Sample the leaf locations and Polya-Gamma auxilliary variables
}
