feMakes <-
function(year, ...){
    response <- feQuery(paste('vehicle/menu/make?year=',year,sep=''))
    if(is.null(response))
        return(NULL)
    out <- xpathSApply(response, '//value', xmlValue)
    #class(out) <- c('feMakes',class(out))
    return(out)
}
