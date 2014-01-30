feQuery <-
function(op, baseurl='http://www.fueleconomy.gov/ws/rest/', ...){
    url <- paste(baseurl, op, sep='')
    response <- tryCatch(xmlParse(url), error=function(e) return(NULL))
    return(response)
}
