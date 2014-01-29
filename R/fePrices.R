fePrices <-
function(...){
    response <- feQuery('fuelprices')
    out <- xmlToList(response)
    class(out) <- c('fePrices',class(out))
    return(out)
}
