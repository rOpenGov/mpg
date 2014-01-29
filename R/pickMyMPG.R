pickMyMPG <-
function(graphics=TRUE){
    makes <- mympgMakes()
    make <- menu(makes, title = "Make", graphics = graphics)
    models <- mympgModels(make=makes[make])
    model <- menu(models, title = "Model", graphics = graphics)
    opts <- mympgVehicles(make=makes[make], model=models[model])
    return(opts)
}
