rvg package
================

<!-- badges: start -->

[![R-CMD-check](https://github.com/davidgohel/rvg/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/davidgohel/rvg/actions/workflows/R-CMD-check.yaml)
[![version](https://www.r-pkg.org/badges/version/rvg)](https://CRAN.R-project.org/package=rvg)
![cranlogs](https://cranlogs.r-pkg.org/badges/rvg) <!-- badges: end -->

`rvg` is providing two graphics devices that produces Vector Graphics
outputs in DrawingML format for Microsoft PowerPoint with `dml_pptx` and
for Microsoft Excel with `dml_xlsx`. Theses formats let users edit the
graphic elements (*editable graphics*) within PowerPoint or Excel and
have a very good rendering.

These raw XML outputs cannot be used *as is*. Functions `dml` and
`ph_with()` have to be used with package `officer` to add vector
graphics in PowerPoint documents (`dml` function is a simple wrapper to
mark the plot instructions as Vector Graphics instructions).

``` r
library(rvg)
library(ggplot2)
library(officer)

my_vec_graph <- dml(code = barplot(1:5, col = 2:6))

doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with(doc, my_vec_graph, location = ph_location_fullsize() )
print(doc, target = "my_plot.pptx")
```

Function `xl_add_vg()` is the equivalent for Excel workbooks.

``` r
doc <- read_xlsx()
doc <- xl_add_vg(doc, sheet = "Feuil1", code = print(gg), 
  width = 6, height = 6, left = 1, top = 2 )
print(doc, target = "vg.xlsx")
```

By default, theses graphics are *editable*, element edition can be
disabled with option `editable = FALSE`.

## Installation

You can get the development version from GitHub:

``` r
devtools::install_github("davidgohel/rvg")
```

Install the CRAN version:

``` r
install.packages("rvg")
```
