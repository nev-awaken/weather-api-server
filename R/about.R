#' About
#' 
#' Render the about.
#' 
#' @inheritParams handler
#' 
#' @name views
#' @keywords internal
about_get <- \(req, res) {
  res$render(
    template_path("about.html")
  )
}
