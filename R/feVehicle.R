feVehicle <-
function(id=NULL, pick=FALSE, ...){
    if(pick)
        id <- pickVehicle(...)
    response <- feQuery(paste('vehicle',id,sep='/'))
    out <- xmlToList(response)
    class(out) <- c('feVehicle',class(out))
    return(out)
}

print.feVehicle <- function(x, ...){
    d <- setNames(data.frame(t(rbind(x))), 'value')
    cat('Vehicle data:\n')
    print(d[!rownames(d)=='emissionsList',,drop=FALSE])
    if(!is.null(x$emissionsList)){
        cat('\nEmissions List:\n')
        print.feVehicleEmissions(x$emissionsList)
    }
    return(invisible(x))
}
