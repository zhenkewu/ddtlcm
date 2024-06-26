% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_DDT_functions.R
\name{simulate_lcm_given_tree}
\alias{simulate_lcm_given_tree}
\title{Simulate multivariate binary responses from a latent class model given a tree}
\usage{
simulate_lcm_given_tree(
  tree_phylo,
  N,
  class_probability = 1,
  item_membership_list,
  Sigma_by_group = NULL,
  root_node_location = 0,
  seed_parameter = 1,
  seed_response = 1
)
}
\arguments{
\item{tree_phylo}{a "phylo" tree with K leaves}

\item{N}{number of individuals}

\item{class_probability}{a length K vector, where the k-th element is the
probability of assigning an individual to class k. It does not have to sum up to 1}

\item{item_membership_list}{a list of G elements, where the g-th element contains the
column indices of the observed data matrix corresponding to items in major group g}

\item{Sigma_by_group}{a length-G vector for the posterior mean group-specific diffusion variances.}

\item{root_node_location}{the coordinate of the root node parameter. By default, the node parameter
initiates at the origin so takes value 0. If a value, then the value will be repeated into a
length J vector. If a vector, it must be of length J.}

\item{seed_parameter}{an integer random seed to generate parameters given the tree}

\item{seed_response}{an integer random seed to generate multivariate binary observations from LCM}
}
\value{
a named list of the following elements:
\describe{
\item{\code{tree_with_parameter}}{a "phylo4d" tree with K leaves.}
\item{\code{response_prob}}{a K by J matrix, where the k,j-th element is the response
probability of item j for individuals in class k}
\item{\code{response_matrix}}{a K by J matrix with entries between 0 and 1 for the item
response probabilities.}
\item{\code{class_probability}}{a K-vector with entries between 0 and 1 for the class
probabilities. Entries should be nonzero and sum up to 1, or otherwise will be normalized}
\item{\code{class_assignments}}{a N-vector with integer entries from 1, ..., K. The initial values for
individual class assignments.}
\item{\code{Sigma_by_group}}{a G-vector greater than 0. The initial values for the group-specific diffusion
variances.}
\item{\code{c}}{a value greater than 0. The initial values for the group-specific diffusion
variances.}
\item{\code{item_membership_list}}{same as input}
}
}
\description{
Generate multivariate binary responses from the following process:
For individual i = 1, ..., N,
\eqn{Z_i ~ Categorical_K(prior_class_probability)}
For item j = 1, ..., J,
\eqn{Y_{ij} | Z_i = k ~ Binomial(class_item_probability_{kj})}
}
\examples{
# load the MAP tree structure obtained from the real HCHS/SOL data
data(parameter_diet)
# unlist the elements into variables in the global environment
list2env(setNames(parameter_diet, names(parameter_diet)), envir = globalenv()) 
# number of individuals
N <- 496
# set random seed to generate node parameters given the tree
seed_parameter = 1
# set random seed to generate multivariate binary observations from LCM
seed_response = 1
# simulate data given the parameters
sim_data <- simulate_lcm_given_tree(tree_phylo, N, 
                                    class_probability, item_membership_list, Sigma_by_group, 
                                    root_node_location = 0, seed_parameter = 1, seed_response = 1)
}
\seealso{
Other simulate DDT-LCM data: 
\code{\link{simulate_DDT_tree}()},
\code{\link{simulate_lcm_response}()},
\code{\link{simulate_parameter_on_tree}()}
}
\concept{simulate DDT-LCM data}
