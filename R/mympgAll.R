mympgAll <-
function(id=NULL, pick=FALSE, ...){
    # individual records for a specific vehicle
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('ympgDriverVehicle',id,sep='/'),
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    out <- xmlToDataFrame(response)
    out$cityPercent <- as.numeric(out$cityPercent)
    out$highwayPercent <- as.numeric(out$highwayPercent)
    out$mpg <- as.numeric(out$mpg)
    out$state <- factor(out$state)
    out$vehicleId <- as.numeric(out$vehicleId)
    class(out) <- c('mympgDriver',class(out))
    return(out)
}
