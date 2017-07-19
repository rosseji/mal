

df_MT <- mal::fetch_sentences()

check <- df_MT %>%
  add_speaker() %>%
  sent_to_words(keep_jorn = T) %>%
  clean_text()
