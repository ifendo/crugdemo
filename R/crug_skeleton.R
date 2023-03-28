#' Project Template demo
#'
#' @param path The path of the new project
#' @param ... additional project template options
#'
#'

crug_skeleton <- function(path, ...) {
    # ensure path exists
    dir.create(path, recursive = TRUE, showWarnings = FALSE)

    # generate header
    header <- c(
        "# This file was generated when creating project using `crugdemo` template.",
        "# The following inputs were received:",
        ""
    )

    # collect inputs
    dots <- list(...)
    text <- lapply(seq_along(dots), function(i) {
        key <- names(dots)[[i]]
        val <- dots[[i]]
        paste0(key, ": ", val)
    })

    # collect into single text string
    contents <- paste(
        paste(header, collapse = "\n"),
        paste(text, collapse = "\n"),
        sep = "\n"
    )

    # write to index file
    writeLines(contents, con = file.path(path, "INDEX"))
}
