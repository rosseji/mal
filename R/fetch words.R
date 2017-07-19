#' Get data for MT speeches as sentences
#'
#' "Anyone who thinks it's smart to cut immigration is sentencing Australia to poverty" - MT
#'
#' @name fetch_sentences
#' @param path Defaults to storage
#' @return Returns data frame
#' @export

fetch_sentences <- function(
  path = "/TrendLock/showcase projects/turnbull/media_sentences.feather",
  sample = T) {

  if (!sample) {
    feather::read_feather(glue::glue("{fetch::fetch_local_path()}{path}"))
  } else {
    feather::read_feather(glue::glue("{fetch::fetch_local_path()}{stringr::str_replace(path, '.feather', '_sample.feather')}"))
  }
}

