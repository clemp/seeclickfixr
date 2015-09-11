\name{list_issue_types}
\alias{list_issue_types}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Query issue types in a given location
}
\description{
Returns all issue types in use in the specific location, specified either by coordinates or by name/address.
}
\usage{
list_issue_types(city, limit = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{city}{
A written description of the location for which issue types should be returned. If city is specified, lat/long should not be.
}
\item{lat}{
Latitude of coordinates, specified instead of city.
}
\item{long}{
Longitude of coordinates, specified instead of city.
}
  \item{limit}{
Number of items to return. Defaults to 100.
}
}


\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (city, limit = 100) 
{
    url <- paste("https://seeclickfix.com/api/v2/issues/new?address=", 
        city, "&per_page=", limit, sep = "")
    rawdata <- readLines(url, warn = F)
    scf <- jsonlite::fromJSON(txt = rawdata, simplifyDataFrame = T, 
        flatten = F)
    allout <- data.frame(title = scf$request_types$title, organization = scf$request_types$organization, 
        url = scf$request_types$url, potential_duplicate_issues_url = scf$request_types$potential_duplicate_issues_url)
    return(allout)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
