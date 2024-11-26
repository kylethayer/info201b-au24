server <- function(input, output) {
  
  output$greeting <- renderText({
    msg <- paste("Hi there ", input[["user_name"]])
    return(msg)
  })
  
  output$hot_dog_response <- renderText({
    if(input[["is_hotdog_sandwich"]] == TRUE){
      return("You answered correctly")
    } else{
      return("YOU ARE WRONG ABOUT THIS!")
    }
  })
}