
#' @export

gas_talk <- function(df_MT, key_words = c("gas",  "coal", "jobs", "innovation")) {

  df_MT <- df_MT %>%
    mutate(test. = case_when(str_detect(media.loc,"qld") ~ "QLD",
                             str_detect(media.loc,"QLD")~ "QLD",
                             str_detect(media.loc,"queensland")~ "QLD",
                             str_detect(media.loc,"Queensland")~ "QLD",
                             str_detect(media.loc,"Brisbane")~ "QLD",
                             str_detect(media.loc,"NSW")~ "NSW",
                             str_detect(media.loc,"New South Wales")~ "NSW",
                             str_detect(media.loc,"Sydney")~ "NSW",
                             str_detect(media.loc,"VIC")~ "VIC",
                             str_detect(media.loc,"Victoria")~ "VIC",
                             str_detect(media.loc,"Melbourne")~ "VIC",
                             str_detect(media.loc,"TAS")~ "TAS",
                             str_detect(media.loc,"Tasmainia")~ "TAS",
                             str_detect(media.loc,"Hobart")~ "TAS",
                             str_detect(media.loc,"NT")~ "NT",
                             str_detect(media.loc,"Nothern")~ "NT",
                             str_detect(media.loc,"Darwin")~ "NT",
                             str_detect(media.loc,"Western")~ "WA",
                             str_detect(media.loc,"WA")~ "WA",
                             str_detect(media.loc,"Perth")~ "WA",
                             str_detect(media.loc,"Adelaide")~ "SA",
                             str_detect(media.loc,"SA")~ "SA",
                             str_detect(media.loc,"South Australia")~ "SA",
                             str_detect(media.loc,"Canberra")~ "ACT",
                             str_detect(media.loc,"ACT")~ "ACT",
                             str_detect(media.loc,"Australian Capital")~ "ACT")) %>%
    mutate(test. = ifelse(is.na(test.), "Other", test.))


  df_MT <- df_MT %>%
    add_speaker() %>%
    sent_to_words(keep_jorn = T) %>%
    clean_text()

  df_MT <- df_MT %>%
    filter(word %in% key_words)


  gas. <- df_MT %>%
    mutate(week. = floor_date(media.date, "week")) %>%
    group_by(week., word, test.) %>%
    summarise(times.said = n())


  p <- ggplot(gas., aes(x = week., y = times.said, col = word)) +
    geom_line(size = 3, alpha = 0.5) +
    facet_wrap(~test.)

  print(p)
}






