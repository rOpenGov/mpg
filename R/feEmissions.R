feEmissions <-
function(id=NULL, pick=FALSE, ...){
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('vehicle/emissions',id,sep='/'))
    out <- xmlToList(response)
    class(out) <- c('feVehicleEmissions',class(out))
    return(out)
}

print.feVehicleEmissions <-
function(x, row.names=FALSE, ...){
    d <- do.call(rbind, lapply(x, as.data.frame))
    print(d, row.names=row.names)
    return(invisible(x))
}

