list_issue_types <- function(city, limit = 100) {
  total <- 0
  page <- 1
  url <- paste("https://seeclickfix.com/api/v2/issues/new?address=", city,"&per_page=",limit,"&page=",page, sep = "")
  rawdata <- readLines(url, warn = F)
  scf <- jsonlite::fromJSON(txt=rawdata,simplifyDataFrame = T,flatten=F)
  allout <- data.frame(title = scf$request_types$title,
                       organization = scf$request_types$organization,
                       url = scf$request_types$url,
                       potential_duplicate_issues_url = scf$request_types$potential_duplicate_issues_url
  )
  
  total <- nrow(allout)
  
  while(limit>total){
    page <- page+1
    if((limit-total)<100){limit <- (limit-total)}
    url <- paste("https://seeclickfix.com/api/v2/issues/new?address=", city,"&per_page=",limit,"&page=",page, sep = "")
    rawdata <- readLines(url, warn = F)
    scf <- jsonlite::fromJSON(txt=rawdata,simplifyDataFrame = T,flatten=F)
    holder <- data.frame(title = scf$request_types$title,
                         organization = scf$request_types$organization,
                         url = scf$request_types$url,
                         potential_duplicate_issues_url = scf$request_types$potential_duplicate_issues_url
    )
    allout <- rbind(allout,holder)
    total <- nrow(allout) 
  }
  return(allout)
}
