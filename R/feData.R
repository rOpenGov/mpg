feData <-
function(type, year=NULL, ...){
    # bulk pull all data
    if(!is.null(year)){
        if(is.null(type) || type=='vehicles'){
            y <- substring(year, nchar(year)-1, nchar(year))
            y2 <- as.numeric(y)
            if(y2 %in% c(84:97))
                u <- paste('http://www.fueleconomy.gov/feg/epadata/',y,'mfgui.zip',sep='')
            else if(y2==98)
                u <- 'http://www.fueleconomy.gov/feg/epadata/98guide6.zip'
            else if(y2==99)
                u <- 'http://www.fueleconomy.gov/feg/epadata/99guide.zip'
            else if(y2 %in% c(78:83) | (y2 > 0 && y2 < 78) | y=='00')
                u <- paste('http://www.fueleconomy.gov/feg/epadata/',y,'data.zip',sep='')
            else
                stop('Unrecognized year')
        } else if(type=='greenguide') {
            y <- substring(year, nchar(year)-1, nchar(year))
            u <- paste('http://www.fueleconomy.gov/feg/EPAGreenGuide/txt/all_alpha_',y,'.txt',sep='')
        } else
            stop("selected 'type' not supported")
    } else if(type=='vehicles'){
        u <- 'http://www.fueleconomy.gov/feg/epadata/vehicles.csv.zip'
    } else if (type=='emissions')
        u <- 'http://www.fueleconomy.gov/feg/epadata/emissions.csv.zip'
    tmp <- tempfile()
    d <- download.file(u, tmp, mode='wb')
    if(d)
        stop('File download failed')
    if(type=='greenguide'){
        # do something
        out <- read.table(u, fill=TRUE)
        names(out) <- as.character(unname(unlist(out[1,,drop=TRUE])))
        out <- out[-1,]
    } else {
        f <- unzip(tmp, list=TRUE)
        ucon <- unz(file.path(tempdir(),tmp), filename=f$Name)
        ## These are actually xlsx files, not CSV...so that sucks ##
        ## out <- read.csv(ucon)
        close(ucon)
    }
    unlink(tmp)
}
