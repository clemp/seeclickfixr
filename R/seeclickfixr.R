library(RJSONIO)

get_city_issues <- function(city) {
  if (!city %in% c("hartford", "new-haven")) {
    stop("only works for 'hartford' and 'new-haven' right now")
  }
  
  url <- paste("https://seeclickfix.com/api/v2/issues?place_url=", city, "&per_page=100", sep = "")
  scf <- readLines(url, warn = F)
  scf <- fromJSON(scf)
  data.frame(do.call("rbind", scf$issues))
}

list_issue_types <- function(city) {
  if (!city %in% c("hartford", "new-haven")) {
    stop("only works for 'hartford' and 'new-haven' right now")
  }
  
  url <- paste("https://seeclickfix.com/api/v2/issues/new?address=", city, sep = "")
  scf <- readLines(url, warn = F)
  scf <- fromJSON(scf)
  
  data.frame(do.call("rbind", scf$request_types))
}

search_issue_type <- function(city, issue_type) {
  if (!city %in% c("hartford", "new-haven")) {
    stop("only works for 'hartford' and 'new-haven' right now")
  }
  
  url <- paste("https://seeclickfix.com/api/v2/issues?place_url=", city, "&search=", issue_type, sep = "")
  scf <- readLines(url, warn = F)
  scf <- fromJSON(scf)
  
  data.frame(do.call("rbind", scf$issues))
}

get_specific_issue <- function(issue_id) {
  
  url <- paste("http://seeclickfix.com/api/v2/issues/", issue_id, sep = "")
  scf <- readLines(url, warn = F)
  scf <- fromJSON(scf)
  
  data.frame(t(do.call("rbind", scf)))
  
}
