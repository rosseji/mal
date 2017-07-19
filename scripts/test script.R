

df_MT <- mal::fetch_sentences()

check <- df_MT %>%
  add_speaker()
