% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ddtlcm_fit.R
\name{ddtlcm_fit}
\alias{ddtlcm_fit}
\title{MH-within-Gibbs sampler to sample from the full posterior
distribution of DDT-LCM}
\usage{
ddtlcm_fit(
  K,
  data,
  item_membership_list,
  total_iters = 5000,
  initials = list(),
  priors = list(),
  controls = list(),
  initialize_args = list(method_lcm = "random", method_dist = "euclidean", method_hclust
    = "ward.D", method_add_root = "min_cor", alpha = 0, theta = 0)
)
}
\arguments{
\item{K}{number of classes (integer)}

\item{data}{an NxJ matrix of multivariate binary responses, where
N is the number of individuals, and J is the number of granular items}

\item{item_membership_list}{a list of G elements, where the g-th element contains the column
indices of \code{data} corresponding to items in major group g, and G is number of major item groups}

\item{total_iters}{number of posterior samples to collect (integer)}

\item{initials}{a named list of initial values of the following parameters:
\describe{
\item{\code{tree_phylo4d}}{a phylo4d object. The initial tree have K leaves (labeled as "v1" through "vK"),
1 singleton root node (labeled as "u1"), and K-1 internal nodes (labeled as "u1" through \eqn{u_{K-1}}).
The tree also contains parameters for the leaf nodes and the root node (which
equals 0). The parameters for the internal nodes can be NAs because they will not be used in the
algorithm.}
\item{\code{response_prob}}{a K by J matrix with entries between 0 and 1. The initial values for the
item response probabilities. They should equal to the expit-transformed leaf parameters of \code{tree_phylo4d}.}
\item{\code{class_probability}}{a K-vector with entries between 0 and 1. The initial values for the class
probabilities. Entries should be nonzero and sum up to 1, or otherwise will be normalized}
\item{\code{class_assignments}}{a N-vector with integer entries from 1, ..., K. The initial values for
individual class assignments.}
\item{\code{Sigma_by_group}}{a G-vector greater than 0. The initial values for the group-specific diffusion
variances.}
\item{\code{c}}{a value greater than 0. The initial values for the group-specific diffusion
variances.}
}
Parameters not supplied with initial values will be initialized using the \code{initialize} function
with arguments in \code{initialize_args}.}

\item{priors}{a named list of values of hyperparameters of priors. See the function
\code{initialize} for explanation.
\describe{
\item{\code{shape_sigma}}{a G-vector of positive values. The g-th element is the shape parameter for the
inverse-Gamma prior on diffusion variance parameter sigma_g^2. Default is rep(2, G).}
\item{\code{rate_sigma}}{a G-vector of positive values. Rate parameter. See above. Default is rep(2, G).}
\item{\code{prior_dirichlet}}{a K-vector with entries positive entries. The parameter of the Dirichlet prior
on class probability.}
\item{\code{shape_c}}{a positive value. The shape parameter for the Gamma prior on divergence function
hyperparameter \code{c}. Default is 1.}
\item{\code{rate_c}}{a positive value. The rate parameter for \code{c}. Default is 1.}
\item{\code{a_pg}}{a positive value. The scale parameter for the generalized logistic distribution used in
the augmented Gibbs sampler for leaf parameters. Default is 1, corresponding to the standard logistic
distribution.}
}}

\item{controls}{a named list of control variables.
\describe{
\item{\code{fix_tree}}{a logical. If \code{TRUE} (default), the tree structure will be sampled in the algorithm. If \code{FALSE},
the tree structure will be fixed at the initial input.}
\item{\code{c_order}}{a numeric value. If \code{1}, the divergence function is \eqn{a(t) = c/(1-t)}. If \code{2}, the divergence
function is \eqn{a(t) = c/(1-t)^2}.}
}}

\item{initialize_args}{a named list of initialization arguments. See the function
\code{initialize} for explanation.}
}
\value{
an object of class "ddt_lcm"; a list containing the following elements:
\describe{
\item{\code{tree_samples}}{a list of information of the tree collected from the sampling algorithm, including:
\code{accept}: a binary vector where \code{1} indicates acceptance of the proposal tree and \code{0} indicates rejection.
\code{tree_list}: a list of posterior samples of the tree.
\code{dist_mat_list}: a list of tree-structured covariance matrices representing the marginal covariances
among the leaf parameters, integrating out the internal node parameters and all intermediate stochastic paths
in the DDT branching process.}
\item{\code{response_probs_samples}}{a \code{total_iters} x \code{K} x \code{J} array of posterior samples of item response probabilities}
\item{\code{class_probs_samples}}{a \code{K} x \code{total_iters} matrix of posterior samples of class probabilities}
\item{\code{Z_samples}}{a \code{N} x \code{total_iters} integer matrix of posterior samples of individual class assignments}
\item{\code{Sigma_by_group_samples}}{a \code{G} x \code{total_iters} matrix of posterior samples of diffusion variances}
\item{\code{c_samples}}{a \code{total_iters} vector of posterior samples of divergence function hyperparameter}
\item{\code{loglikelihood}}{a \code{total_iters} vector of log-likelihoods of the full model}
\item{\code{loglikelihood_lcm}}{a \code{total_iters} vector of log-likelihoods of the LCM model only}
\item{\code{setting}}{a list of model setup information, including: \code{K}, \code{item_membership_list}, and \code{G}}
\item{\code{controls}}{a list of model controls, including:
\code{fix_tree}: FALSE to perform MH sampling of the tree, TRUE to fix the tree at the initial input.
\code{c_order}: a numeric value of \code{1} or \code{2} (see Arguments))}
\item{\code{data}}{the input data matrix}
}
}
\description{
Use DDT-LCM to estimate latent class and tree on class profiles for
multivariate binary outcomes.
}
\examples{
# load the MAP tree structure obtained from the real HCHS/SOL data
data(data_synthetic)
# extract elements into the global environment
list2env(setNames(data_synthetic, names(data_synthetic)), envir = globalenv()) 
# run DDT-LCM
result <- ddtlcm_fit(K = 3, data = response_matrix, item_membership_list, total_iters = 50)
}
