mympgMakes <-
function(...){
    response <- feQuery('menu/make',
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    if(is.null(response))
        return(NULL)
    out <- xpathSApply(response, '//value', xmlValue)
    #class(out) <- c('feMakes',class(out))
    return(out)
}
