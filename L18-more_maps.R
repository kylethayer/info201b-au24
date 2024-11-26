library(dplyr)
library(ggplot2)


# Load state shapefile
state_shape <- map_data("state")

# Example map where all states have a different color
ggplot() +
  geom_polygon(
    data = state_shape,
    aes(
      x = long,
      y = lat,
      group = group,
      fill = region
    ))

# Example map where all states have colors based on a value
state_data <- read.csv("L18-demo-state-info.csv")

state_data_with_shape <- state_data |> 
  inner_join(state_shape, join_by(state == region)) 

ggplot() +
  geom_polygon(
    data = state_data_with_shape,
    aes(
      x = long,
      y = lat,
      group = group,
      fill = electoral_college_votes
    )
  )

# Example of dots for each state on top of a world map
state_data <- read.csv("L18-demo-state-info.csv")

# Load state shapefile
world_shape <- map_data("world")

world_map_elector_college <- 
  ggplot() +
  geom_polygon(
    data = world_shape,
    aes(
      x = long,
      y = lat,
      group = group
    ),
    fill = "gray"
  ) +
  geom_point(
    data = state_data,
    aes(
      x = longitude,
      y = latitude,
      color = electoral_college_votes
    )
  )

ggplotly(world_map_elector_college)

# alternative with size being votes instead of color
world_map_elector_college <- 
  ggplot() +
  geom_polygon(
    data = world_shape,
    aes(
      x = long,
      y = lat,
      group = group
    ),
    fill = "gray"
  ) +
  geom_point(
    data = state_data,
    aes(
      x = longitude,
      y = latitude,
      size = electoral_college_votes
    ),
    color = "red"
  )

ggplotly(world_map_elector_college)
