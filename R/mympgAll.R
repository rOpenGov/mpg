mympgAll <-
function(id=NULL, pick=FALSE, ...){
    # individual records for a specific vehicle
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('ympgDriverVehicle',id,sep='/'),
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    class(out) <- c('mympgDriver',class(out))
    return(out)
}
