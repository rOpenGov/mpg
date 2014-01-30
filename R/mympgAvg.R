mympgAvg <-
function(id=NULL, pick=FALSE, ...){
    # averages for specific vehicle
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('ympgVehicle',id,sep='/'),
                        baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
    out <- xmlToList(response)
    class(out) <- c('mympgAvg',class(out))
    return(out)
}

print.mympgAvg <- function(x, row.names=FALSE, ...){
    d <- do.call(cbind.data.frame, x)
    print(d, row.names=row.names)
    return(invisible(x))
}