#' Functions to support the Folder view
#'
#' @param path,pattern,recursive,properties arguments passed to
#'   \link[base]{list.files}.
#'
#' @export
#' @rdname folder
folderGetInfo <- function(path, pattern, recursive, properties) {

  fileInfo <- function(path, pattern, recursive) {
    file.info(list.files(
      path,
      pattern,
      full.names = TRUE,
      recursive = recursive,
      include.dirs = FALSE
    ))
  }

  typeCoercions <- function(dat) {
    dat$mode <- as.integer(dat$mode)
    dat
  }

  selectProperties <- function(dat, properties) {
    dat[properties]
  }

  rowNames2Column <- function(dat) {
    dat <- cbind(file = rownames(dat), dat)
    rownames(dat) <- NULL
    dat
  }

  dat <- fileInfo(path, pattern, recursive)
  dat <- typeCoercions(dat)
  dat <- selectProperties(dat, properties)
  dat <- rowNames2Column(dat)

  dat
  
}

#' @export
#' @rdname folder
folderInit <- function(folderInfo, files) {
  datatable(folderInfo, selection = 'single')
}
