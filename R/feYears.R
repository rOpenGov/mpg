feYears <-
function(...){
    response <- feQuery('vehicle/menu/year')
    if(is.null(response))
        return(NULL)
    out <- xpathSApply(response, '//value', xmlValue)
    #class(out) <- c('feYears',class(out))
    return(out)
}
