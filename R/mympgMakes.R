mympgMakes <-
function(...){
    response <- feQuery('menu/make',
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    out <- xpathSApply(response, '//value', xmlValue)
    class(out) <- c('feMakes',class(out))
    return(out)
}
