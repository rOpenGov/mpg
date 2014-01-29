mympgAvg <-
function(id=NULL, pick=FALSE, ...){
    # averages for specific vehicle
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('ympgVehicle',id,sep='/'),
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    class(out) <- c('mympgVehicle',class(out))
    return(out)
}
