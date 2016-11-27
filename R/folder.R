#' Functions to support the Folder view
#'
#' @param path,pattern,recursive,properties arguments passed to
#'   \link[base]{list.files}.
#'
#' @export
#' @rdname folder
folderGet <- function(path, pattern, recursive, properties) {

  dat <- file.info(list.files(
    path,
    pattern,
    full.names = TRUE,
    recursive = recursive,
    include.dirs = FALSE
  ))

  dat$mode <- as.integer(dat$mode)

  dat[properties]
  
}


