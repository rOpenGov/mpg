feQuery <-
function(op, baseurl='http://www.fueleconomy.gov/ws/rest/', ...){
    url <- paste(baseurl, op, sep='')
    response <- xmlParse(url)
}
