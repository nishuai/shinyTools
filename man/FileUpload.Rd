% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FileUpload.R
\name{FileUpload}
\alias{FileUpload}
\title{FileUpload}
\usage{
FileUpload(input, output, session, rename = FALSE, checkFiles = NULL,
  checkNames = NULL, addArgs = NULL)
}
\arguments{
\item{input}{argument used by shiny session}

\item{output}{argument used by shiny session}

\item{session}{argument used by shiny session}

\item{rename}{bool (FALSE) whether interactive renaming of uploaded files is enabled}

\item{checkFiles}{chr or NULL (NULL) if not NULL name of a function which can be used as a quality check for uploaded files}

\item{checkNames}{chr or NULL (NULL) if not NULL name of a function which can be used as a quality check user defined names}

\item{addArgs}{list or NULL (NULL) if not NULL list of additional arguments which will be passed to checkFiles or checkNames}
}
\value{
data.frame of information about uploaded files (and user defined generic names)
}
\description{
This file upload handler provides some functionalities for file uploading and possible renaming of uploaded files.
}
\details{
On server side there is an additional option to include a function call which can be used to do a quality check
with uploaded files.
With argument checkFiles a function name can be defined.
This function must take a data.frame as first argument, which will contain information about uploaded files.
It has columns name, datapath, size, type.
If the uploaded files should be valid, the function must return NULL.
If they should not be valid a chr string must be returned.
This chr string will be shown in red in the ui as user feedback.

checkNames works like checkFiles, just that it is a quality check for the user defined names, if rename = TRUE.
It must take a chr vector as first argument which are the names defined by the user.

Additional argumets can be handed over to both functions via the list addArgs.
}
\examples{
library(shinyTools)

# check functions as example
check1 <- function(df, add){ if(any(grepl(add$type, df$type))) return(paste("Don't upload", add$type, "files."))}
check2 <- function(names, add){ if(any(grepl(add$pat, names))) return(paste("Don't use", add$pat, "in a file name."))}

# little app with module
ui <- fluidPage(sidebarLayout(
  sidebarPanel( width = 4, h2("FileUploadUI"),
                FileUploadUI("uploadID", "Upload File", rename = "Rename File", multiple = TRUE, horiz = TRUE)
  ),
  mainPanel( width = 8, h2("Return value of FileUpload"),
             verbatimTextOutput("content1")
  )
))
server <-function(input, output, session) {
  info <- callModule(FileUpload, "uploadID", rename = TRUE, checkNames = "check2", checkFiles = "check1",
                     addArgs = list(pat = "a", type = "text"))
  output$content1 <- renderPrint(info())
}
shinyApp(ui, server)

}
\seealso{
Other FileUpload module functions: \code{\link{FileUploadUI}}
}

