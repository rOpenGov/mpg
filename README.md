# mpg <a href='https://ropengov.github.io/mpg/'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](http://ropengov.org/)
[![R build
status](https://github.com/rOpenGov/mpg/workflows/R-CMD-check/badge.svg)](https://github.com/rOpenGov/mpg/actions)

<!-- badges: end -->


## Fuel economy data from FuelEconomy.gov 

Bored of `mtcars`? Want to play around with tcl/tk menus in R? Looking to buy a new car? The **mpg** package provides access to the [FuelEconomy.gov](https://www.fueleconomy.gov/) [API](https://www.fueleconomy.gov/feg/ws/index.shtml), allowing users to pull in both vehicle-specific and comprehensive U.S. fuel economy data from all available makes, models, and years since 1984 (and provides easy access to Excel-formatted data files going back to 1978). The package also wraps the [My MPG](https://www.fueleconomy.gov/mpg/MPG.do) service, which allows drivers to upload their own fuel usage data.

The package is released under GPL-2 and all data accessible via the API is in the public domain.


---
## Install latest version ##

To install the latest development version from GitHub:

    # install.packages("devtools")
    library("devtools")
    install_github("rOpenGov/mpg")

---
## Using the package ##

To pull data from the FuelEconomy API, one needs to know the vehicle identification number for a specific make-model-year. **mpg** therefore provides a set of functions: `feYears`, `feMakes`, `feModels`, and `feOptions` for sequentially and interactively retrieving the vehicle identification number. An interactive wrapper function `pickVehicle` simplifies this process by running through those functions as either (1) tcl/tk menus or (2) text-based menus in the R console. An example of the latter menu version is shown here:

```
> pickVehicle(graphics=FALSE)
Year 

 1: 2015   2: 2014   3: 2013   4: 2012   5: 2011   6: 2010   7: 2009   8: 2008   9: 2007  10: 2006  11: 2005  12: 2004  13: 2003  14: 2002  15: 2001
16: 2000  17: 1999  18: 1998  19: 1997  20: 1996  21: 1995  22: 1994  23: 1993  24: 1992  25: 1991  26: 1990  27: 1989  28: 1988  29: 1987  30: 1986
31: 1985  32: 1984  

Selection: 2
Make 

 1: Acura               2: Aston Martin        3: Audi                4: Bentley             5: BMW                 6: Bugatti          
 7: Buick               8: Cadillac            9: Chevrolet          10: Chrysler           11: Dodge              12: Ferrari          
13: Fiat               14: Ford               15: GMC                16: Honda              17: Hyundai            18: Infiniti         
19: Jaguar             20: Jeep               21: Kia                22: Lamborghini        23: Land Rover         24: Lexus            
25: Lincoln            26: Lotus              27: Maserati           28: Mazda              29: Mercedes-Benz      30: MINI             
31: Mitsubishi         32: Nissan             33: Porsche            34: Ram                35: Rolls-Royce        36: Roush Performance
37: Scion              38: smart              39: SRT                40: Subaru             41: Toyota             42: Volkswagen       
43: Volvo              

Selection: 43
Model 

 1: S60 AWD
 2: S60 FWD
 3: S80 AWD
 4: S80 FWD
 5: XC60 AWD
 6: XC60 FWD
 7: XC70 AWD
 8: XC70 FWD
 9: XC90 AWD
10: XC90 FWD

Selection: 1
Options 

1: Auto (S6), 6 cyl, 3.0 L, Turbo
2: Auto (S6), 5 cyl, 2.5 L, Turbo

Selection: 1
[1] "33658"
```

With a vehicle identification number in hand, it is easy to pull down vehicle-specific fuel economy and emissions data:

```
> feVehicle(33658)
Vehicle data:
                           value
atvType                     NULL
barrels08              15.689436
barrelsA08                   0.0
charge120                    0.0
charge240                    0.0
city08                        18
city08U                     17.9
cityA08                        0
cityA08U                     0.0
cityCD                       0.0
cityE                        0.0
cityUF                       0.0
co2                          425
co2A                          -1
co2TailpipeAGpm              0.0
co2TailpipeGpm             425.0
comb08                        21
comb08U                  20.5531
combA08                        0
combA08U                     0.0
combE                        0.0
combinedCD                   0.0
combinedUF                   0.0
cylinders                      6
displ                        3.0
drive            All-Wheel Drive
engId                         23

...

Emissions List:
         efid    id salesArea score scoreAlt smartwayScore standard     stdText
 EVVXJ03.0U2T 33658         3   5.0     -1.0            -1       B5       Bin 5
 EVVXJ03.0U2T 33658         7   6.0     -1.0            -1       U2 LEV-II ULEV


> feEmissions(33658)
         efid    id salesArea score scoreAlt smartwayScore standard     stdText
 EVVXJ03.0U2T 33658         3   5.0     -1.0            -1       B5       Bin 5
 EVVXJ03.0U2T 33658         7   6.0     -1.0            -1       U2 LEV-II ULEV
```

Integration with the My MPG site also enables the download of user-submitted fuel economy data, either as averages for a vehicle type or at the individual-level (i.e., a single driver's reported fuel data):

```
> mympgAvg(26425)
       avgMpg cityPercent highwayPercent maxMpg minMpg recordCount vehicleId
 49.363820544          45             55     74     35         187     26425

> mympgAll(26425)
    cityPercent highwayPercent                  lastDate      mpg state vehicleId
1            50             50 2011-04-10T00:00:00-04:00 73.80000    MI     26425
2            10             90 2011-01-02T00:00:00-05:00 62.20000    FL     26425
3            60             40 2011-05-26T00:00:00-04:00 60.88670    TX     26425
4            60             40 2009-07-16T00:00:00-04:00 60.30000    IL     26425
5            23             77 2014-01-20T00:00:00-05:00 60.18105    AZ     26425
6            10             90 2012-06-06T00:00:00-04:00 60.00000    NJ     26425
7            20             80 2013-05-19T00:00:00-04:00 59.90000    VA     26425
8            45             55 2011-05-23T00:00:00-04:00 59.76956    MA     26425
9            72             28 2014-01-21T00:00:00-05:00 59.67671    WA     26425
10           20             80 2009-09-01T00:00:00-04:00 59.00000    ME     26425
11           60             40 2012-02-18T00:00:00-05:00 58.84354    CA     26425
...
```

With the My MPG API it is also possible to identify sets of individual vehicle data using `mympgVehicles` (based on make and model retrieved from `mympgMakes` and `mympgModels` or through interactive menus similar to `pickVehicle` by specifying `pick=TRUE` in either `mympgAvg` or `mympgAll`).

