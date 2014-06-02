\name{ebSNP}
\alias{ebSNP}
\title{
Genotype-call for single-sample next generation sequencing data using
empirical Bayes method
}
\usage{
ebSNP(dat, T1 = 0.5, T2 = 0.5, eps = 0.001, maxstep = 30)
}
%- maybe also 'usage' for other objects documented here.
\description{
  Genotype-call tool for single-sample next generation sequencing data using
empirical Bayes method.
}
\arguments{
  \item{dat}{
    A data matrix with two rows, containing the number of major and
    minor alleles at each position. Each column corresponds to one position.
}
\item{T1}{
  Lower threshold for genotyping.
}
  \item{T2}{
Upper threshold for genotyping.
}
  \item{eps}{
Stopping criteria of EM algorithm.
}
  \item{maxstep}{
Maximum number of EM iterations.
}
}
\value{
  A list,
  \item{pi0.hat}{Estimate for pi0, the probability of a position bearing
    a homozygous genotype.}
  \item{alpha.hat}{Estimate for alpha.}
  \item{beta.hat}{Estimate for beta.}
  \item{delta}{1-g_i.}
  \item{G}{Estimated genotypes.}
}
\references{
  Single-sample SNP Detection By Empirical Bayes Method Using Next Generation Sequencing Data
}
\author{
Na You
}
\examples{

N <- 100
cvg <- 40
pi0 <- 0.95
a <- 1
b <- 10
pi1 <- 1-pi0
z <- rbinom(N,1,pi1)
n.homo <- N-sum(z)
p <- rep(0,N)
p[which(z==0)] <- rbeta(n.homo,a,b)
p[which(z==1)] <- 1/2
nc <- sapply(1-p,function(x) rbinom(1,cvg,x)) 
dat <- rbind(nc,cvg-nc)
ebSNP(dat)
ebSNP(dat,0.1,0.9)
}
