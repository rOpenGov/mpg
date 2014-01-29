mympgModels <-
function(make, ...){
    response <- feQuery(paste('menu/model?make=',make,sep=''),
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    out <- xpathSApply(response, '//value', xmlValue)
    class(out) <- c('feMakes',class(out))
    return(out)
}
