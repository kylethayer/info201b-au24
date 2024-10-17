library(dplyr)
library(stringr)
library(ggplot2)

pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")

# example, find average price of all pants
avg_price <- 
  pocket_df |>
  pull(price) |>
  mean()

# find average price of all Levi's
avg_price_levis <-
  pocket_df |>
  filter(brand == "Levi's") |>
  pull(price) |>
  mean()

#####
# Mutate

# try to get first fabric percent based on first two characters of fabric
pocket_df <- 
  pocket_df |>
  mutate(first_fabric_per = str_sub(fabric, end=2))

# NOTE: this fails for ones that are 100%, since it just gets "10"

# another example, approximate area size of front pocket
# we'll just do minHeightFront * minWidthFront
pocket_df <-
  pocket_df |>
  mutate(front_area = minHeightFront * minWidthFront)

#####
# Summarize

# get summary values (total number pants, average price, number brands)
pants_summary_df <-
  pocket_df |>
  summarize(
    total_pants = n(),
    avg_price = mean(price),
    num_brands = n_distinct(brand)
  )


# Note: summary makes a dataframe, to get a value out use pull
avg_price_levis <-
  pocket_df |>
  filter(brand == "Levi's") |>
  summarize(avg_price = mean(price)) |>
  pull(avg_price)

####
# Group_by then summarize
# Get summary values for each brand (total number pants, average price)
pants_summary_by_brand_df <-
  pocket_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )


# Note: Summarizing by groups is really good for making bar charts
# where each group is a bar
pants_summary_by_brand_df |>
  ggplot() +
  geom_col(aes(x = brand, y = avg_price))


#### 
# Data cleaning

# problem: extra space on Guess
# problem: 7 for All Mankind vs. 7 for all Mankind
cleaned_pants_df <-
  pocket_df |>
  mutate(
    brand = trimws(brand)
  ) |>
  mutate(
    brand = ifelse(
      brand == "7 for all Mankind", 
      "7 for All Mankind", 
      brand)
  )

# now group by brand and summarize then graph
pants_summary_by_brand_df <-
  cleaned_pants_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )

pants_summary_by_brand_df |>
  ggplot() +
  geom_col(aes(x = brand, y = avg_price))



