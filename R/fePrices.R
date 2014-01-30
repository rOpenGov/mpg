fePrices <-
function(...){
    response <- feQuery('fuelprices')
    out <- xmlToList(response)
    out <- sapply(out,as.numeric)
    #class(out) <- c('fePrices',class(out))
    return(out)
}
