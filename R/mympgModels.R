mympgModels <-
  function(make, ...) {
    response <- feQuery(paste("menu/model?make=", make, sep = ""),
      baseurl = "http://www.fueleconomy.gov/ws/rest/ympg/shared/"
    )
    if (is.null(response)) {
      return(NULL)
    }
    out <- xpathSApply(response, "//value", xmlValue)
    # class(out) <- c('feModels',class(out))
    return(out)
  }
