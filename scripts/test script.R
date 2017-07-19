

df_MT <- mal::fetch_sentences()

df_MT <- df_MT %>%
  add_speaker(keep = F) %>%
  sent_to_words(keep_jorn = T) %>%
  clean_text()


df_MT <- df_MT %>%
  add_locations()

# talking about gas
df_MT %>%
  gas_talk()

# hot spots
df_MT %>%
  filter(!word %in% c("prime", "minister", "australia", "australians", "australian", "people", "government", "it's")) %>%
  hot_spots()

