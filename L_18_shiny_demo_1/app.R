# install.packages("shiny")
library(shiny)
source("ui.R")
source("server.R")

# run the application
shinyApp(ui = ui, server = server)