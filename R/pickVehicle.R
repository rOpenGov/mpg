pickVehicle <-
function(graphics=TRUE){
    years <- feYears()
    year <- menu(years, title = "Year", graphics = graphics)
    makes <- feMakes(year=years[year])
    make <- menu(makes, title = "Make", graphics = graphics)
    models <- feModels(year=years[year], make=makes[make])
    model <- menu(models, title = "Model", graphics = graphics)
    opts <- feOptions(year=years[year], make=makes[make], model=models[model])
    opt <- menu(names(opts), title = "Options", graphics = graphics)
    return(unlist(unname(opts[opt])))
}
