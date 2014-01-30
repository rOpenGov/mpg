mympgVehicles <-
function(make, model, pick=FALSE, graphics=TRUE, ...){
    if(pick){
        makes <- mympgMakes()
        make <- menu(makes, title = "Make", graphics = graphics)
        models <- mympgModels(make=makes[make])
        model <- menu(models, title = "Model", graphics = graphics)
        out <- mympgVehicles(make=makes[make], model=models[model])
    } else{
        if(is.null(make))
            stop("Must supply 'make' | set 'pick=TRUE'")
        if(is.null(make))
            stop("Must supply 'model' | set 'pick=TRUE'")
        response <- feQuery(paste('vehicles?make=',make,'&model=',model,sep=''),
                            baseurl='http://www.fueleconomy.gov/ws/rest/ympg/shared/')
        if(is.null(response))
            return(NULL)
        out <- xmlToDataFrame(response)
    }
    #class(out) <- c('mympgVehicles',class(out))
    return(out)
}