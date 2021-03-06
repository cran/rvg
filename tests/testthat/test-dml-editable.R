context("Test DrawingML editable properties")
library(xml2)

test_that("check pptx editable properties", {

  file <- tempfile()
  dml_pptx( file = file, editable = FALSE, bg = "transparent" )
  plot.new()
  points(0.2, 0.2)
  dev.off()

  x <- read_xml(file)
  xpath_ <- ".//p:sp/p:nvSpPr/p:cNvSpPr/a:spLocks"
  node <- xml_find_first(x, xpath_, ns = xml_ns( x ))
  expect_is(object = node, class = "xml_node")

  file <- tempfile()
  dml_pptx( file = file, editable = TRUE, bg = "transparent" )
  plot.new()
  points(0.2, 0.2)
  dev.off()
  x <- read_xml(file)
  xpath_ <- ".//p:sp/p:nvSpPr/p:cNvSpPr/a:spLocks"
  selected_node <- xml_find_first(x, xpath_, ns = xml_ns( x ))
  expect_is(selected_node, class = "xml_missing")
})


test_that("check xlsx editable properties", {

  file <- tempfile()
  dml_xlsx( file = file, editable = FALSE, bg = "transparent" )
  plot.new()
  points(0.2, 0.2)
  dev.off()

  x <- read_xml(file)
  xpath_ <- ".//xdr:sp/xdr:nvSpPr/xdr:cNvSpPr/a:spLocks"
  node <- xml_find_first(x, xpath_, ns = xml_ns( x ))
  expect_is(object = node, class = "xml_node")

  file <- tempfile()
  dml_xlsx( file = file, editable = TRUE, bg = "transparent" )
  plot.new()
  points(0.2, 0.2)
  dev.off()
  x <- read_xml(file)
  xpath_ <- ".//xdr:sp/xdr:nvSpPr/xdr:cNvSpPr/a:spLocks"
  selected_node <- xml_find_first(x, xpath_, ns = xml_ns( x ))
  expect_is(selected_node, class = "xml_missing")
})
