ui <- fluidPage(
  
  # static content
  h1("My INFO 201 App", align="center"),
  
  # Dynamic input -- text input box
  textInput(inputId = "user_name", #inputID is important!!
            label="What's your name?"  
  ),
  
  # Dynamic output -- a message from the server.R
  #  outputID is important!! (should match server)
  textOutput(outputId = "greeting"),
  
  # Radio buttons for is a hotdog a sandwich
  radioButtons(
    inputId = "is_hotdog_sandwich",
    label = "Is a hotdog a sandwich",
    choices = list(
      "Yes" = TRUE,
      "No" = FALSE
    ),
    selected = TRUE
  ),
  
  # dynamic output of the text hot_dog_response
  textOutput(outputId = "hot_dog_response")
)