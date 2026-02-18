# My MPG data

Retrieve all fuel economy data from My MPG by vehicle ID

## Usage

``` r
mympgAll(id = NULL, pick = FALSE, ...)
```

## Arguments

- id:

  A vehicle ID number.

- pick:

  A logical indicating whether to select the ID number via an
  interactive menu.

- ...:

  Options passed to
  [`pickVehicle`](https://ropengov.github.io/mpg/reference/pickVehicle.md),
  if `pick=TRUE`.

## Author

Thomas J. Leeper
