
#' @export


fetch_words <- function(
  path = "/TrendLock/showcase projects/turnbull/media_words.feather",
  sample = T) {

  if (!sample) {
    feather::read_feather(glue::glue("{fetch::fetch_local_path()}{path}"))
  } else {
    feather::read_feather(glue::glue("{fetch::fetch_local_path()}{stringr::str_replace(path, '.feather', '_sample.feather')}"))
  }

}

