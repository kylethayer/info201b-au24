library(dplyr)
library(ggplot2)

us_census <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/US_census.csv")
star_wars_films <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/num_star_wars_films_by_year.csv")


# different ways of joining/graphing

# Example 1: inner_join by year
inner_df <- us_census |>
  inner_join(star_wars_films, join_by(year == year))

inner_df |> 
  ggplot() +
  geom_col(aes(x = year, y = num_star_wars_films))

# Problem is I lost all the data from years that weren't exact decades


# Example 2: full_join by year
full_df <- us_census |> 
  full_join(star_wars_films, join_by(year == year))

# now I can see all star wars films
full_df |> 
  ggplot() +
  geom_col(aes(x = year, y = num_star_wars_films))

#But if I graph population vs. star wars films, I miss most data
full_df |> 
  ggplot() +
  geom_point(aes(x = US_population, y = num_star_wars_films))

# most data is still at NA

# Can graph both datapoints on same axis, though they are different scales
full_df |> 
  ggplot() +
  geom_point(aes(x = year, y = num_star_wars_films)) +
  geom_point(aes(x = year, y = US_population))

# We can add a separate scale to show both at once on the same graph
full_df |> 
  ggplot() +
  geom_point(aes(x = year, y = US_population * .000000005), color="red") +
  geom_point(aes(x = year, y = num_star_wars_films), color="blue") +
  scale_y_continuous("Num Star Wars Films", sec.axis = sec_axis(~ . * .000000005 , name = "US Population"))



## Example 3: Summarize star wars films into decade
star_wars_films <- star_wars_films |>
  mutate(decade = round(year, digits=-1))

# group by and summarize by decade
star_wars_by_decade <- 
  star_wars_films |>
  group_by(decade) |>
  summarize(
    num_star_wars_films = sum(num_star_wars_films)
  )

# now I can join by decade == year
decade_joined <- 
  star_wars_by_decade |> 
  inner_join(us_census, join_by(decade == year))

# now population vs num star wars films doesn't miss info
decade_joined |> 
  ggplot() +
  geom_point(aes(x = US_population, y = num_star_wars_films))



# Example 4: Use two different dataframes to make a graph without joining them
# you can set a different dataset for a different geometry element
star_wars_films |>
  ggplot() +
  geom_line(
    aes(x = year, y = num_star_wars_films), 
    color="blue"
  ) +
  geom_line(
    data = us_census,
    aes(x = year, y = US_population * .000000005), 
    color="red"
  ) +
  scale_y_continuous("Num Star Wars Films", sec.axis = sec_axis(~ . * .000000005 , name = "US Population"))



##################################################
### Example of an even more difficult dataset
a_df <- data.frame(
  age = c("25-34", "35-44", "45-54", "55-64", "65+"),
  prop_a = c(56, 34, 30, 22, 12)
)

b_df <- data.frame(
  age = c("30-39", "40-49", "50-59", "60-69", "70+"),
  prop_b = c(8, 5, 10, 15, 19)
)

# There is no clear way to combine them. You can try
# shifting one set over by 5 years, or you can try finding 
# midpoints between sets in each version. Whatever you do
# you'll have to explain what you did and the problems that
# what you did to the data can cause
