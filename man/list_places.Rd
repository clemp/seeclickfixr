\name{list_places}
\alias{list_places}
\title{
Query sub-city neighborhoods in which issues can be reported.
}
\description{
Returns a list of sub-city neighborhoods where citizens can report issues.
}
\usage{
list_places(startingpoint, limit = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{startingpoint}{
Starting point around which the names of sub-city locations will be returned.}
  \item{limit}{
The maximum number of location names to be returned.
}
}

\value{
\item{id}{Unique place id}
\item{name}{Name of sub-city neighborhood/location}
\item{url_name}{URL for }
\item{county}{County where the location is}
\item{state}{State where the location is}
\item{place_type}{Type of location (city, county, neighborhood)}
\item{url}{URL for}
\item{html_url}{}
\item{html_report_url}{}
\item{type}{}
\item{lat}{Latitude of coordinates for location}
\item{lng}{Longitude of coordinates for location}
}
\references{
%% ~put references to the literature/web site here ~
}
\seealso{
\code{\link{list_issue_types}}
}
