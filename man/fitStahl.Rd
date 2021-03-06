% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/fitStahl.R
\name{fitStahl}
\alias{fitStahl}
\title{Fit Stahl model}
\usage{
fitStahl(xoloc, chrlen, nu = c(1, 20), p = 0.02, max.conv = 25,
  integr.tol = 0.00000001, max.subd = 1000, min.subd = 10,
  verbose = TRUE, ...)
}
\arguments{
\item{xoloc}{A list of crossover locations (in cM), each component being a
vector of locations for a different meiotic product.}

\item{chrlen}{Chromosome length (in cM), either of length 1 or the same
length as \code{xoloc}.}

\item{nu}{Interference parameter (\eqn{\nu}{nu}).  This should be a pair of
values to be used as endpoints to first do a 1-dimensional optimization with
\eqn{p=0}.}

\item{p}{Starting value for the proportion of crossovers from the no
interference pathway, for the 2-dimensional optimization.}

\item{max.conv}{Maximum limit for summation in the convolutions to get
inter-crossover distance distribution from the inter-chiasma distance
distributions.  This should be greater than the maximum number of chiasmata
on the 4-strand bundle.}

\item{integr.tol}{Tolerance for convergence of numerical integration.}

\item{max.subd}{Maximum number of subdivisions in numerical integration.}

\item{min.subd}{Minimum number of subdivisions in numerical integration.}

\item{verbose}{If TRUE, print tracing information.  If "\dots{}" includes
\code{control}, this is ignored.}

\item{\dots}{Further arguments sent to \code{\link[stats]{optim}}.}
}
\value{
A vector with the estimates of \eqn{\nu}{nu} (interference
parameter) and \eqn{p} (proportion of crossovers coming from the no
interference pathway), the maximized log likelihood, the estimate of nu with
p constrained to be 0, the maximized log likelihood in this case, and the
log likelihood ratio for comparing the model with p allowed to vary freely
versus contrained to be 0.  (Note that it's the natural log of the
likelihood ratio, and not twice that.)
}
\description{
Fit the Stahl model for crossover interference to data on crossover
locations.
}
\details{
See Housworth and Stahl (2003) and Broman and Weber (2000) for details of
the method.

We first use \code{\link[stats]{optimize}} to find the MLE with the
contraint \code{p=0}, followed by use of \code{\link[stats]{optim}} to do a
2-dimensional optimization for the MLEs of the pair.
}
\examples{
data(bssbsb)
\dontshow{bssbsb <- bssbsb[,1:50]}

xoloc <- find.breaks(bssbsb, chr=1)
L <- attr(xoloc, "L")

# get MLE (limiting maximum iterations to 10, just for speed in this example)
\dontrun{mle <- fitStahl(xoloc, L, nu=c(9, 12), control=list(maxit=10))}
\dontshow{mle <- fitStahl(xoloc, L, nu=c(9, 12), control=list(maxit=2))}
}
\author{
Karl W Broman, \email{kbroman@biostat.wisc.edu}
}
\references{
Housworth, E. A. and Stahl, F. W. (2003) Crossover interference
in humans. \emph{Am. J. Hum. Genet.} \bold{73}, 188--197.

Broman, K. W. and Weber, J. L. (2000) Characterization of human crossover
interference. \emph{Am. J. Hum. Genet.} \bold{66}, 1911--1926.
}
\seealso{
\code{\link{fitGamma}}, \code{\link{stahlLoglik}},
\code{\link{simStahl}}
}
\keyword{models}

