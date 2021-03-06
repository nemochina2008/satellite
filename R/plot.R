if ( !isGeneric('plot') ) {
  setGeneric('plot', function(x, ...)
    standardGeneric('plot'))
}

#' Plot a 'Satellite' object
#' 
#' @description
#' This is the standard plotting routine for the 'Satellite' class. Layers are 
#' drawn either from the start (default; limited to a maximum of 16 sub-plots) 
#' or according to the speficied band codes.
#' 
#' @param x A 'Satellite' object, usually returned by \code{\link{satellite}}. 
#' @param bcde Band codes to be visualized, e.g. returned by 
#' \code{\link{getSatBCDE}}. If not supplied, the initial (up to) 16 layers are 
#' being visualized.
#' @param col Color scheme.
#' @param ... Further arguments passed on to \code{\link{plot.default}}.
#' 
#' @seealso \code{\link{plot.default}}, \code{\link{par}}.
#' 
#' @examples
#' \dontrun{
#' ## sample data
#' path <- system.file("extdata", package = "satellite")
#' files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
#' sat <- satellite(files)
#' 
#' ## display data without quality flag layer
#' bds <- getSatBCDE(sat)[1:11]
#' plot(sat, bcde = bds)
#' }
#' 
#' @export
#' @name plot
NULL

# set methods -------------------------------------------------------------
#' @aliases plot,Satellite-method
#' @rdname plot
setMethod('plot', signature(x = 'Satellite'), 
          function(x,
                   bcde = NULL, 
                   col = grDevices::grey.colors(100), 
                   ...) {
            
            ## if 'bcde' is not supplied, visualize the initial (up to 16)
            ## layers, else visualize the specified bands
            ls_lyr <- getSatDataLayers(x, bcde = bcde)
            ch_bcde <- sapply(ls_lyr, names)
            
            # par settings
            int_lyr_len <- length(ls_lyr)
            int_nrow <- int_ncol <- 1L
            if (int_lyr_len == 2) {
              int_ncol <- 2L
            } else if (int_lyr_len > 2 & int_lyr_len <= 4) {
              int_nrow <- int_ncol <- 2L
            } else if (int_lyr_len > 4 & int_lyr_len <= 6) {
              int_nrow <- 2L; int_ncol <- 3L
            } else if (int_lyr_len > 6 & int_lyr_len <= 9) {
              int_nrow <- int_ncol <- 3L
            } else if (int_lyr_len > 9 & int_lyr_len <= 12) {
              int_nrow <- 3L; int_ncol <- 4L
            } else if (int_lyr_len > 12) {
              int_nrow <- int_ncol <- 4L
              
              if (int_lyr_len > 16) {
                ls_lyr <- ls_lyr[1:16]
                int_lyr_len <- length(ls_lyr)
              }
            }
            
            # visualize
            graphics::par(mfrow = c(int_nrow, int_ncol))
            for (i in 1:int_lyr_len) {
              stats4::plot(ls_lyr[[i]], col = col, ...)
              graphics::title(ch_bcde[i], line = .2)
            }
            
            ## reset par settings
            graphics::par(mfrow = c(1, 1))
            
            return(invisible())
          })    