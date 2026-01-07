
# Example function that adds two numbers together

# Define a function (this makes the function available, but doesn't run it)
add_numbers <- function(num_1, num_2){
  # Do my function work and calculations
  result <- num_1 + num_2
  
  # return my final result to the code that called this function
  return(result)
}

# Try running the function
add_numbers(5, 8)

# My function returned a result, so I can save that into a variable
example_sum <- add_numbers(23, 59)

# NOTE: the add_numbers function's arguments are required
# so if I try to run it without providing two values, it will
# give an error
add_numbers()
add_numbers(5)
add_numbers(2,3,4)

# One other potential error, is if I provide my function values that
# don't match its expectations, it may break
add_numbers("Hello", TRUE)

#### Optional argument
# I can make a default value for the second number if I want, so it
# is optional
add_numbers <- function(num_1, num_2 = 2){
  # Do my function work and calculations
  result <- num_1 + num_2
  
  # return my final result to the code that called this function
  return(result)
}

# try running it without providng num_2
add_numbers(5)

# two ways I can provide that second number
add_numbers(5, 7)
add_numbers(5, num_2 = 7)

#### Another example, make a greeting message
make_greeting <- function(name){
  greeting <- paste("Hello", name)
  
  return(greeting)
}

# try running it
make_greeting("Kyle")

# redo with optional argument for greeting work
make_greeting <- function(name, greeting_word = "Hello"){
  greeting <- paste(greeting_word, name)
  
  return(greeting)
}

make_greeting("Kyle")
make_greeting("Kyle", greeting_word="Hi")
make_greeting("Kyle", greeting_word="Hola")


# redo with one more optional argument for post_name_text
make_greeting <- function(name, greeting_word = "Hello", post_name_text = ""){
  greeting <- paste0(greeting_word, " ", name, post_name_text)
  
  return(greeting)
}

make_greeting("Kyle")
make_greeting("Kyle", post_name_text="!")
make_greeting("Kyle", post_name_text="! How are you?", greeting_word="Hi")


# note: You can send values in any order IF you provide the name when you pass
# them to the function
add_numbers(num_2=5, num_1=3)

