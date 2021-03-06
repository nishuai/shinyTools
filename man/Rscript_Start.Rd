% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ProcessFunctions.R
\name{Rscript_Start}
\alias{Rscript_Start}
\title{Rscript_Start}
\usage{
Rscript_Start(id, script, log = c(paste0("Start process with id ", id, ":"),
  script), logFile = NULL, info = NULL)
}
\arguments{
\item{id}{\code{chr} of process id. This id will be used by \code{RProcessFinish} to watch results of this process.
It defines how \code{.*status} and \code{.*rds} files for this process are named.}

\item{script}{\code{chr} full path of R batch script which is to be started}

\item{log}{\code{chr} arr used as log entry in case a log file exists. Each element is a line.}

\item{logFile}{\code{chr} or \code{NULL} (\code{NULL}) full path of log file is needed. This log file will be used by the process started}

\item{info}{\emph{ProcessInfo} object or \code{NULL} (\code{NULL}).
This is a list of relevant information about the process.
It can be created with \code{\link{Rscript_Init}}.
If \code{NULL} the global environment is searched for an object of class \emph{ProcessInfo}.}
}
\value{
TRUE
}
\description{
This function is used to start another R script from a R script started with a RProcess module such as \code{\link{RProcess}}.
}
\details{
For correct communication with the shiny session an \emph{ProcessInfo} object given (argument \code{info}).
If a log file exists, it is appended with the message given in argument \code{log}. Each element is a line.
If a session id exists the log is prefixed with it.
If a process id exists, before writing anything the loaded process id is compared with the current one -- read from the \code{*.status} file.
If they do not match the R session ends with a call to \code{quit}.
This ensures that, in case a newer version of the same process is running, the current one will quit and not overwrite anything.
}
\seealso{
These Rscript communication functions are used in R scripts started by a RProcess module such as \code{\link{RProcess}}.
         For some examples on how they work together see the vignette \emph{RProcess Module Functions}.

Other Rscript communication functions: \code{\link{ReadInfo}},
  \code{\link{Rscript_Abort}}, \code{\link{Rscript_Fin}},
  \code{\link{Rscript_Init}}, \code{\link{Rscript_Log}},
  \code{\link{Rscript_Try}}, \code{\link{Rscript_Up}}
}

