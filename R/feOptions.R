feOptions <-
function(year, make, model, ...){
    response <- feQuery(paste('vehicle/menu/options?year=', year,
                                                  '&make=', make,
                                                  '&model=',model, sep=''))
    out <- xpathApply(response, '//value', xmlValue)
    names(out) <- xpathSApply(response, '//text', xmlValue)
    class(out) <- c('feOptions',class(out))
    return(out)
}
