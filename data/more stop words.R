
more_stop_words <- tibble(word = c(
  "it’s",
  "people",
  "that’s",
  "we’re",
  "we’ve",
  "i’m",
  "you’ve",
  "you’re",
  "don’t",
  "i’m",
  "i’m",
  "i’m"
))

devtools::use_data(more_stop_words, internal = F, overwrite = T)
