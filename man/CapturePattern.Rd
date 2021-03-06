% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CapturePattern.R
\name{CapturePattern}
\alias{CapturePattern}
\title{CapturePattern}
\usage{
CapturePattern(input, output, session, pat, lines, n = 5, cols = NULL)
}
\arguments{
\item{input}{argument used by shiny session}

\item{output}{argument used by shiny session}

\item{session}{argument used by shiny session}

\item{pat}{reactive chr of regular expression}

\item{lines}{reactive chr arr of strings in which the regular expression should capture substrings}

\item{n}{int(= 5) number of lines to be displayed}

\item{cols}{chr arr or NULL(NULL) defining colors to label capture groups in the order they appear in each string
If NULL 4 default colors are used (ggl colors).}
}
\description{
The CapturePattern Module extracts captures from chr strings based on a regular expression and displays them.
}
\details{
This is a module which helps in writing a regular expression to extract information from an array of chr strings.
The module looks for capture groups in the regular expression and uses them on each string.
Strings are displayed as text output with each capture group being labelled by a color.

Regular expression (pat) and the strings (lines) are both reactive, so changing either will lead to an update.

The number of lines displayed can be specified (default = 5).
So it is possible to --say-- scan a big  file of strings and use them as lines argument in this module.

The colors can be defined. If more captures than the defined colors are found, these captures are not labelled.
So if length(cols) == 2 but 4 capture groups are found, only the first 2 apear colored.

Nested capture groups do not work.
}
\examples{
library(shinyTools)

# some generic strings with regular expressions
regexes <- list("^(.+?)_.*$", "^(.+?)_(.*?)_(.*?)\\\\.(.*)$", "^.*(SG.+?)1.*_(.+?)_.*$")
lib <- paste0("ENSG00000139", apply(expand.grid(0:9, 0:9, 0:9, "_8_", sample(20000:60000, 5), ".", sample(20000:60000, 5)),
                                    1, function(x) paste0(x, collapse = "")))
# little app with module
ui <- fluidPage(sidebarLayout(
  sidebarPanel( width = 4, h2("Pattern as input"), p("Not part of Module UI"),
                selectizeInput("regex", "Regex", choices = regexes, options = list(create = TRUE)),
                helpText("Write your own Regex to try out.")
  ),
  mainPanel( width = 8, h2("CapturePatternUI"),
             CapturePatternUI("cap", "Patterns Captured")
  )
))

server <-function(input, output, session) {
  callModule(CapturePattern, "cap", pat = reactive(input$regex), lines = reactive(lib))
}

shinyApp(ui, server)

}
\seealso{
Other CapturePattern module functions: \code{\link{CapturePatternUI}},
  \code{\link{GetCaptures}}
}

