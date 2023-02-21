library(jsonlite)
library(tidyverse)

tmp <- fromJSON("https://groundhog-day.com/api/v1/groundhogs/")

groundhogs <- tmp$groundhogs %>%
  tidyr::separate(col = coordinates, into = c("lat", "long"), sep = ",", remove = F) %>%
  mutate_at(c("lat", "long"), .funs = as.numeric)

predictions <- select(groundhogs, id, name, lat, long, isGroundhog, active, predictions) %>%
  unnest(predictions)

