% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Bayesian.R
\docType{data}
\name{sim_scenario1}
\alias{sim_scenario1}
\title{Setting for Scenario 1 of the Simulation Study}
\format{
Phi: the true common factor loading matrix

Lambda_s: a list of four matrices containing the true study-specific factor loadings matrices

Psi_s: a list of four matrices containing the true error covariance matrices

X_s: a list of four data matrices, each with 60 columns and number of rows between 10 and 14.
     This is just a single dataset for this simulation scenario.

Phi_sd: the estimated common factor loading matrix using the SD method, as defined in De Vito et al. (2020)

Phi_op: the estimated common factor loading matrix using the OP method, as defined in De Vito et al. (2020)

RV_op: the RV coefficient between the estimated OP common factor loadings and the true common factor loadings over 50 datasets

RV_sd: the RV coefficient between the estimated SD common factor loadings and the true common factor loadings over 50 datasets
}
\usage{
sim_scenario1
}
\description{
Setting for Scenario 1 of the Simulation Study
}
\details{
This is a simulated scenario considered in De Vito et al. (2020). The scenario considers four different studies, with three common factors
and sixty genes (variables). The sample size of each study is respectively (10, 15, 12, 14).
}
\examples{
\dontrun{
The commands below show how the dataset was obtained.
S <- 4
p <- 60
k <- 3
j_s <- rep(1, 4)
n_s <- c(10, 15, 12, 14)
theta <- rep(0, length = p)
PH <- as.vector(zeros(p, k))
noZEROc <- (p / 3) * k
studyc <- runif(noZEROc, 0.6, 1)
sign <- sample(x = length(studyc), size = (length(studyc) / 2))
studyc[sign] <- studyc[sign] * (-1)
positionc <- sample(x = k * p, size = length(studyc))
PH[positionc] <- studyc
Phi <- matrix(PH, p, k)
L <- noZERO <- study <- position <- Lambda_s <- Psi_s <- Sigma_s <- X_s <- list()

for(s in 1:S){
    L[[s]] <- as.vector(zeros(p, j_s[s]))
    noZERO[[s]] <- (p / 3) * j_s[s]
    study[[s]] <- runif(noZERO[[s]], -1, 1)
    position[[s]] <- sample(x = p * j_s[s], size = length(study[[s]]))
    L[[s]][position[[s]]] <- study[[s]]
    Lambda_s[[s]] <- matrix(L[[s]], p, j_s[s])
    Psi_s[[s]] <- diag(runif(p, 0, 1), p)
    Sigma_s[[s]] <- tcrossprod(Phi)  + tcrossprod(Lambda_s[[s]])  + Psi_s[[s]]
    X_s[[s]] <- mvrnorm(n_s[s], theta, Sigma_s[[s]])}
    }
}
\keyword{datasets}
