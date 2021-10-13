feEmissions <-
  function(id = NULL, pick = FALSE, ...) {
    if (pick) {
      id <- pickVehicle(...)
    }
    response <- feQuery(paste("vehicle/emissions", id, sep = "/"))
    if (is.null(response)) {
      return(NULL)
    }
    out <- xmlToList(response)
    class(out) <- c("feVehicleEmissions", class(out))
    return(out)
  }

print.feVehicleEmissions <-
  function(x, row.names = FALSE, ...) {
    d <- do.call(rbind.data.frame, x)
    print(d, row.names = row.names)
    return(invisible(x))
  }
