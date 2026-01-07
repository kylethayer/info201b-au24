# conditionals demo

money <- 3
coffee_price <- 5

if(money > coffee_price){
  print("I have more than enough money to to buy coffee")
} else if(money == coffee_price) {
  print("I have exactly enough money to buy coffee")
} else { # in all other cases (meaning money < coffee_price)
  print("I am not able to buy coffee")
}

########
# Dplyr subsetting demo

library(dplyr)

# load dataset
pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")

# Select gets a subset of columns of the dataframe

# get just the brand and price 
brand_price_df <-
  pocket_df |>
  select(brand, price)

# useful if there are tons of columns making it hard to read
# or if you want to save a smaller size file
# or if you want to save a file but hide private information



# filter gets a subset of the rows based on a condition

# get just Abercrombie pants:
abercrombie_df <-
  pocket_df |>
  filter(brand == "Abercrombie")

# get just Abercrombie pants for men:
abercrombie_men_df <-
  pocket_df |>
  filter(brand == "Abercrombie", menWomen == "men")

# alternate version of above
abercrombie_men_df <-
  pocket_df |>
  filter(brand == "Abercrombie" & menWomen == "men")

# get only expensive ones (over $70)
expensive_pants_df <-
  pocket_df |>
  filter(price > 70)


# find the max price of pants
max_price <- 
  pocket_df |>
  pull(price) |>
  max()

# How do I get the actual row that was that price??

# we can use the saved max to in a filter to get the row(s)
max_price_rows <-
  pocket_df |>
  filter(price == max_price)

# I can do this in a shorter version
max_price_rows <-
  pocket_df |>
  filter(price == max(price))

# So, to ask for brand of the max price pants
max_price_brand <-
  pocket_df |>
  filter(price == max(price)) |>
  pull(brand)

# what is the min price pants?
min_price_rows <-
  pocket_df |>
  filter(price == min(price))

# what is the min price brand?
min_price_brand <-
  pocket_df |>
  filter(price == min(price)) |>
  pull(brand)
