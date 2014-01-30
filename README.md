# Fuel economy data from FuelEconomy.gov #

[![Build Status](https://travis-ci.org/leeper/mpg.png?branch=master)](https://travis-ci.org/leeper/mpg)

Bored of `mtcars`? Want to play around with tcl/tk menus in R? Looking to buy a new car? The **mpg** package provides access to the [FuelEconomy.gov](http://www.fueleconomy.gov/) [API](http://www.fueleconomy.gov/feg/ws/index.shtml), allowing users to pull in both vehicle-specific and comprehensive U.S. fuel economy data from all available makes, models, and years since 1984 (and provides easy access to Excel-formatted data files going back to 1978). The package also wraps the [My MPG](https://www.fueleconomy.gov/mpg/MPG.do) service, which allows drivers to upload their own fuel usage data.

The package is released under GPL-2 and all data accessible via the API is in the public domain.


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
feVehicle(33658)
feEmissions(33658)
```

Integration with the My MPG site also enables the download of user-submitted fuel economy data, either as averages for a vehicle type or at the individual-level (i.e., a single driver's reported fuel data):

```
mympgAvg(26425)
mympgAll(26425)
```

With the My MPG API it is also possible to identify sets of individual vehicle data using `mympgVehicles` (based on make and model retrieved from `mympgMakes` and `mympgModels` or through interactive menus similar to `pickVehicle` by specifying `pick=TRUE` in either `mympgAvg` or `mympgAll`).

