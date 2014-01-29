feVehicle <-
function(id=NULL, pick=FALSE, ...){
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('vehicle',id,sep='/'))
    out <- xmlToList(response)
    class(out) <- c('feVehicle',class(out))
    return(out)
}
