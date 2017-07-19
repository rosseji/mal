

# scrape sentences


library(dev)
library(rvest)
library(glue)
library(tidytext)


master_tbl <- tibble()
for (n in list.files("path!", full.names = T)){

  message(n)
  in_html <- read_html(n)

  tbl <- in_html %>%
    html_nodes("p") %>%
    html_text() %>%
    enframe() %>%
    set_names(c("pc.indx", "sent"))

  media.title <- in_html %>%
    html_nodes("h1") %>%
    html_text()


  media.loc <- in_html %>%
    html_nodes("p.field-location") %>%
    html_text() %>%
    str_trim()
  if (length(media.loc) == 0) media.loc <- NA

  media.date <- tbl[1,] %>%
    separate(sent, c("date.", "x", "y"), sep = "\\|") %>%
    pull(date.) %>%
    str_trim() %>%
    str_replace_all(c(" " = "-", "th" = "")) %>%
    parse_date_time2(orders = "d!-Om!-Y!")

  tbl <- tbl[-1,] %>%
    mutate(media.date,
           media.title,
           media.loc)


  master_tbl <- master_tbl %>%
    bind_rows(tbl)

}

write_feather(master_tbl, "path!")
write_feather(master_tbl %>% head(10000), "path!")
