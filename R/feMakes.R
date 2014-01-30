feMakes <-
function(year, ...){
    response <- feQuery(paste('vehicle/menu/make?year=',year,sep=''))
    out <- xpathSApply(response, '//value', xmlValue)
    #class(out) <- c('feMakes',class(out))
    return(out)
}
