feYears <-
function(...){
    response <- feQuery('vehicle/menu/year')
    out <- xpathSApply(response, '//value', xmlValue)
    #class(out) <- c('feYears',class(out))
    return(out)
}
