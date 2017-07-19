#' Add speaker categorical variable
#'
#' Mutates variable \code{"speaker."} to either \code{"jorn"} or \code{"pm"}.
#'
#'
#' @name clean_text
#' @param df Takes df with sentence level text.
#' @param keep Defaults to TRUE, if FALSE filters out "jorn"...
#' @return Returns data frame
#' @export


add_speaker <- function(df, keep = T) {

  df <- df %>%
    mutate(
      sent = str_trim(sent),
      speaker. = case_when(sent == "JOURNALIST:" ~ "jorn",
                           sent == "PRIME MINISTER:" ~ "pm"))
  df <- df %>%
    fill(speaker.) %>%
    mutate(speaker. = case_when(is.na(speaker.) ~ "pm",
                                !is.na(speaker.) ~ speaker.))

  if (keep){
    df
  } else {
    df %>%
      filter(speaker. == "pm")
  }
}
