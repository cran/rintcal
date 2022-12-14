% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc.R
\name{contaminate}
\alias{contaminate}
\title{Simulate the impact of contamination on a radiocarbon age}
\usage{
contaminate(y, sdev = c(), fraction, F14C, F14C.er = 0, decimals = 5)
}
\arguments{
\item{y}{the true radiocarbon age}

\item{sdev}{the error of the true radiocarbon age}

\item{fraction}{Relative amount of contamination. Must be between 0 and 1}

\item{F14C}{the F14C of the contamination. Set at 1 for carbon of modern radiocarbon age, at 0 for 14C-free carbon, or anywhere inbetween.}

\item{F14C.er}{error of the contamination. Defaults to 0.}

\item{decimals}{Rounding of the output. Since details matter here, the default is to provide 5 decimals.}
}
\value{
The observed radiocarbon age and error
}
\description{
Given a certain radiocarbon age, calculate the observed impact of contamination with a ratio of material with a different 14C content (for example, 1% contamination with modern carbon)
}
\examples{
contaminate(5000, 20, .01, 1) # 1\% contamination with modern carbon
# Impacts of different amounts of contamination with modern carbon:
real.14C <- seq(0, 50e3, length=200)
contam <- seq(0, .1, length=101) # 0 to 10\% contamination
contam.col <- rainbow(length(contam))
plot(0, type="n", xlim=c(0, 55e3), 
  xlab="real", ylim=range(real.14C), ylab="observed")
for(i in 1:length(contam))
  lines(real.14C, contaminate(real.14C, c(), contam[i], 1, decimals=5), col=contam.col[i])
contam.legend <- seq(0, .1, length=6)
contam.col <- rainbow(length(contam.legend))
text(52e3, contaminate(50e3, c(), contam.legend, 1), labels=contam.legend, col=contam.col, cex=.7)
}
\author{
Maarten Blaauw
}
