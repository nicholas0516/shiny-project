#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Prediction of Diamond Price"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3(helpText("Diamond Properties:")),
            numericInput("carat", label = h4("Carats"), step = 0.01, value = 1),
            selectInput("color", label = h4("Color"),
                        choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                       "F" = "F", "G" ="G", "H" = "H", "I" = "I", "J" = "J")),
            selectInput("cut", label = h4("Cut"),
                        choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "^Good",
                                       "Very Good" = "Very Good", "Premium" = "Premium", "Ideal" = "Ideal")),
            selectInput("clarity", label = h4("Clarity"),
                        choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2", "SI1" = "SI1", 
                                       "VS2" = "VS2", "VS1" = "VS1", "VVS2" = "VVS2", "VVS1" = "VVS1", 
                                       "IF" = "IF")),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Price of Diamonds"),
            plotOutput("distPlot"),
            h3("Predicted price of this diamond (in $):"),
            h4(textOutput("price"))
        )
    )
))
