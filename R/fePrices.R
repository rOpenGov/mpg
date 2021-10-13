fePrices <-
  function(...) {
    response <- feQuery("fuelprices")
    if (is.null(response)) {
      return(NULL)
    }
    out <- xmlToList(response)
    out <- sapply(out, as.numeric)
    # class(out) <- c('fePrices',class(out))
    return(out)
  }
