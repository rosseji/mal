#' @export

hot_spots <- function(df) {

  df <- df %>%
    group_by(word) %>%
    mutate(n = n()) %>%
    arrange(desc(n))

  df_result <- df %>%
    split(.$media.loc) %>%
    map(~group_by(., word) %>%
          summarise_all(first) %>%
          arrange(desc(n)) %>%
          head(2)) %>%
    bind_rows()

  df_result <- df_result %>%
    filter(lat > -45,
           lat < -10,
           lon > 113,
           lon < 160) %>%
    group_by(media.loc)

  df_result$grp.idx <- group_indices(df_result)

  library(ggmap)
  df_result_out <<- df_result
  centre_aus <- get_map(c(lon = 149, lat = -34), zoom =5)
  p <- ggmap(centre_aus) +
    ggrepel::geom_label_repel(data = df_result,
                              aes(x = lon, y = lat,
                                  label = word,
                                  fill = factor(grp.idx))) +
    theme(legend.position="none")
  print(p)
}
