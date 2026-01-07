# vectors have to be all the same data type
# and we make them with the c() function
my_vector <- c(30885, "North Cascades", TRUE)

# a list can have different data types
# and we make it with the list() function
my_list <- list(30885, "North Cascades", TRUE)

# NORMALLY with lists, we give each thing a name
my_list_named <- list(
  visits = 30885,
  name = "North Cascades",
  is_open = TRUE
)

# To get values out of a list we can do
# [["name of item"]]
my_list_named[["name"]]
my_list_named[["visits"]]

# or we can do the short hand
# $name of item
my_list_named$name
my_list_named$visits


# Note: We have been using dplyr pull() function
# for dataframes (doesn't work on lists)


# To make datafames, use the data.frames function
# and you can give names (like lists) and save
# vectors into it
np_data_df <- data.frame(
  parks = c("North Cascades", "Olympic", "Rainier"),
  visits = c(30885, 2499177, 1160754)
)


# Dataframe join example:
library(dplyr)
library_df <- data.frame(
  library_id = c(1, 2, 3, 4, 5),
  title = c("Pride and Prejudice", "Parable of the Sower", "Parable of the Sower", "The Dawn of Everything", "The Dawn of Everything"),
  checked_out = c(FALSE, TRUE, TRUE, FALSE, TRUE)
)

authors_df <- data.frame(
  title = c("Ficciones", "The Dawn of Everything", "The Dawn of Everything", "Parable of the Sower"),
  auth_first_name = c("Jorge Luis", "David", "David", "Octavia E."),
  auth_last_name = c("Borges", "Graeber", "Wengrow", "Butler")
)

inner_join_df <- 
  inner_join(library_df, authors_df, join_by(title))

left_join_df <-
  left_join(library_df, authors_df, join_by(title))

right_join_df <-
  right_join(library_df, authors_df, join_by(title))

full_join_df <-
  full_join(library_df, authors_df, join_by(title))


