
# uses in house built function to get lon and lat for all the locations listed...

locs <- mal::fetch_sentences(sample = F) %>%
  pull(media.loc) %>%
  unique()


loc_df <- fetch::fetch_locations(locs)


devtools::use_data(loc_df, internal = F, overwrite = T)
