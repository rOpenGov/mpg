mympgVehicles <-
function(make, model, ...){
    response <- feQuery(paste('vehicles?make=',make,'&model=',model,sep=''),
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    out <- response
    class(out) <- c('mympgVehicles',class(out))
    return(out)
}
