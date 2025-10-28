# Data for Most Common First Names (per 1,000 Americans, 2013)
library(tidyverse)

names_data <- data.frame(
  name = c("Michael", "James", "John", "Robert", "David", "William", "Mary",
           "Christopher", "Joseph", "Richard", "Daniel", "Thomas", "Matthew",
           "Jennifer", "Charles", "Anthony", "Patricia", "Linda", "Mark", "Elizabeth"),
  gender = c("Male", "Male", "Male", "Male", "Male", "Male", "Female",
             "Male", "Male", "Male", "Male", "Male", "Male",
             "Female", "Male", "Male", "Female", "Female", "Male", "Female"),
  per_1000 = c(11.6, 10.2, 9.7, 9.5, 8.9, 7.5, 6.8,
               5.9, 5.4, 5.3, 5.1, 4.9, 4.5,
               4.3, 4.3, 3.8, 3.8, 3.8, 3.6, 3.5)
)

# Order the names by frequency
names_data <- names_data |>
  mutate(name = reorder(name, per_1000))


usethis::use_data(names_data, overwrite = TRUE)
