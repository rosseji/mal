#' Clean words
#'
#' Removes numeric characters, stop words and white space from words...
#'
#' @name clean_text
#' @param df Takes df with
#' @return Returns data frame
#' @export


clean_text <- function(df) {

  df %>%
    mutate(
      # word = str_replace_all(word, c("(0|[1-9][0-9]*)" = "",
      #                                   "," = "",
      #                                   "\\." = "")),
      word = str_replace_all(word, "'", ""),
      word = str_trim(word)) %>%
    filter(word != "") %>%
    #anti_join(more_stop_words)
    anti_join(stop_words) # from tidytext
}

