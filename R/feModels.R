feModels <-
function(year, make, ...){
    response <- feQuery(paste('vehicle/menu/model?year=',year,
                                                '&make=',make,sep=''))
    out <- xpathSApply(response, '//value', xmlValue)
    #class(out) <- c('feModels',class(out))
    return(out)
}
