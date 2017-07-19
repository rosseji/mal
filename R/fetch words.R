
#' @export


fetch_words <- function(
  path = "/TrendLock/showcase projects/turnbull/media_words.feather",
  sample = T) {

  feather::read_feather(glue::glue("{fetch::fetch_local_path()}{path}"))

}
