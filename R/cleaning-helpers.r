english <- temp <- NULL

lookup_table <- dplyr::tribble(
      ~where, ~english,
     "beach",     "US",
     "coast",     "US",
  "seashore",     "UK",
   "seaside",     "UK"
)

#' @export
localize_beach <- function(dat) {
  dplyr::left_join(dat, lookup_table)
}

f_to_c <- function(x) (x - 32) * 5/9

#' @export
celsify_temp <- function(dat) {
  dplyr::mutate(dat, temp = dplyr::if_else(english == "US", f_to_c(temp), temp))
}

#' @export
outfile_path <- function(infile) {
  ts <- timestamp(Sys.time())
  paste0(ts, "_", sub("(.*)([.]csv$)", "\\1_clean\\2", infile))
}
