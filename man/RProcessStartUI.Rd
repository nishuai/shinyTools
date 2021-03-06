% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RProcessStart.R
\name{RProcessStartUI}
\alias{RProcessStartUI}
\title{RProcessStartUI}
\usage{
RProcessStartUI(id)
}
\arguments{
\item{id}{chr id of this object for shiny session}
}
\value{
chr HTML for creating ui elements.
}
\description{
UI part of a start module for R scripts which are stared as background processes by the shiny session.
The UI is a red text field which appears as an error message if the quality check found an error when starting the script.
}
\details{
For more details see the documentation of the corresponding \code{\link{RProcessStart}} function.
}
\examples{

}
\seealso{
Seome examples on how to use RProcess module functions are given in the vignette \emph{RProcess Module Functions}
         (\code{vignette("RProcess_functions", package = "shinyTools")})

In the R script communications functions such as \code{\link{Rscript_Init}} and \code{\link{Rscript_Fin}} should be used
         to ensure correct communication between the R script and the shiny session.

Other RProcess module functions: \code{\link{RProcessFinishUI}},
  \code{\link{RProcessFinish}},
  \code{\link{RProcessStart}}, \code{\link{RProcessUI}},
  \code{\link{RProcess}}
}

