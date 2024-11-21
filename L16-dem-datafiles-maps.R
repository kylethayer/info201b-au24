
# Loading datafile
books_df <- read.csv("L16-books.csv")


# Maps demo
# make sure I've done install.packages("maps")

library(ggplot2)
library(dplyr)

# load the state shapes 
state_shape <- map_data("state")

# make a background of the state shapes:
ggplot(data = state_shape) +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group #this makes it trace each state separately
  ))

# load UW locations
uw_locations_df <- read.csv("L16-uw-locations.csv")

# make a map with the uw locations stuck on it
ggplot(data = state_shape) +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group #this makes it trace each state separately
  )) +
  geom_point(
    data = uw_locations_df,
    aes(
      x = long,
      y = lat),
    color = "red"
  )

# Variation of the map with just washington data
state_shape |> 
  filter(region == "washington") |>
  ggplot() +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group #this makes it trace each state separately
  )) +
  geom_point(
    data = uw_locations_df,
    aes(
      x = long,
      y = lat),
    color = "red"
  )


# Add a coordinate projection to my map to keep it
# from getting distorted

# make sure to install.packages("mapproj")

# Variation of the washington map with coord_map()
state_shape |> 
  filter(region == "washington") |>
  ggplot() +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group #this makes it trace each state separately
  )) +
  geom_point(
    data = uw_locations_df,
    aes(
      x = long,
      y = lat),
    color = "red"
  ) +
  coord_map()


###### choropleth demo

# look at state shape info
state_shape |> 
  pull(region) |>
  unique() |>
  paste(collapse = "\n") |>
  cat()


# load my state data
state_info_df <- read.csv("L16-demo-state-info.csv")

# make a choropleth by joining my state info with the shapes
state_info_df |>
  left_join(state_shape, join_by(state == region)) |>
  ggplot() +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group,
    fill = my.location
  ))+
  coord_map()



# reload my state data
state_info_df <- read.csv("L16-demo-state-info.csv")

# redo same graph, but add points for the missing states
state_info_df |>
  left_join(state_shape, join_by(state == region)) |>
  ggplot() +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group,
    fill = my.location
  ))+
  geom_point( # a point for each state (with data)
    data = state_info_df, # use just my csv without the geomotry stuff
    aes(
      x = longitude,
      y = latitude,
      color = my.location
    )
  )
  coord_map()