#install.packages("shiny")
library(shiny)

shinyUI( pageWithSidebar(
  # Application title
  headerPanel("Guess The Computer Generated Number!"),
  
  sidebarPanel(
    textInput('guess', 'Number', value = ""),
    h5('Please press \'Go!\' only on your first attempt'),
    actionButton("goButton", "Go!")
  ), 
  mainPanel(
    h2('Guess an integer between 1 and 10'),
    h5('The objective of this game is to guess an integer between
                   1 and 10 (inclusive) and try to match it with the computer\'s
                   selection'),
    h3('Results of guess'),
    h4('You entered'),
    verbatimTextOutput("inputValue"),
    h4('Which is...'),
    verbatimTextOutput("outputValue")
  )
)
)