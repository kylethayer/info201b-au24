library(dplyr)
library(ggplot2)

#### Review
# Demo of where to use group_by
midwest <- midwest

# how many people in the midwest?
midwest |>
  pull(poptotal) |>
  sum()

# how many people in Illinois?
# filter for just IL, pull out populations, sum together
midwest |>
  filter(state == "IL") |>
  pull(poptotal) |>
  sum()

# If want to do this for each state all at the same time
# I can use group_by and then summarize
state_pop_df <- 
  midwest |>
  group_by(state) |>
  summarize(total_pop = sum(poptotal))

# Note: These summarize dataframes are convenient for making
# graphs 
state_pop_df |>
  ggplot() +
  geom_col(aes(x = state, y = total_pop))


##### JOINS
# Demo store info
store_items_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/store_items.csv")
user_cart_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/user_cart.csv")

# to calculate how much the user has to pay, I have to join
# the user info with the store price info
user_cart_with_price_df <-
  user_cart_df |>
  left_join(store_items_df, join_by(item_name))

# now that I have the quantity in the cart and the price
# I can calculate the cost of each item type for the user
user_cart_with_price_df <-
  user_cart_with_price_df |>
  mutate(total_item_price = quantity * item_price)

# finally find their total cart price by adding together all the
# total_item_price values
total_cost <-
  user_cart_with_price_df |>
  pull(total_item_price) |>
  sum()

#NOTE: IF I do a right join, the items the user didn't have show up as quantity of NA 
user_cart_right_join_df <-
  user_cart_df |>
  right_join(store_items_df, join_by(item_name))


#### 
# Demo flight data:
library("nycflights13")

# make flights and airports visible in R studio
flights <- flights
airports <- airports

# join flight destinations to the airports info 
flights_with_dest_info_df <-
  flights |>
  left_join(airports, join_by(dest == faa))

