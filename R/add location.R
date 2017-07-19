#' Add Lon and Lat for Places
#'
#' Join from in house data.
#'
#' @name add_locations
#' @param df Text df.
#' @param df_loc Loc df, defaults to in house
#' @return Returns data frame of locations names and lon and lat.
#' @export

add_locations <- function(df, df_loc = loc_df) {
  df_loc <- df_loc %>%
    filter(!is.na(lon)) %>%
    set_names(c("lon","lat","media.loc"))

  inner_join(df,
             df_loc,
             by = c("media.loc"))
}
