% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/intcal_json.R
\name{intcal.data.frames}
\alias{intcal.data.frames}
\title{Extract from the intcal file}
\usage{
intcal.data.frames(obj, ...)
}
\arguments{
\item{obj}{Name of the object}

\item{...}{Additional options can be provided, see examples}
}
\description{
Extract items from the intcal json file.
}
\examples{
 intcal <- intcal.read.data()
 # all datasets from the Southern Hemisphere:
 sh.data <- intcal.data.frames(intcal, intcal_set_type='SH') 
 head(sh.data)
 Irish.oaks <- intcal.data.frames(intcal, intcal_set=3) 
 head(Irish.oaks[[2]]$data)
}
