#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

# select the data
data <- diamonds[, c(1:4,7)]

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$distPlot <- renderPlot({
        
        # filter the data with selected properties
        dataSelect <- filter(data, grepl(input$color, color), grepl(input$cut, cut), grepl(input$clarity, clarity))
        # linear regression model
        linearModel <- lm(price~carat, dataSelect)
        # predicted price
        pricePredict <- predict(linearModel, newdata = data.frame(carat = input$carat, cut = input$cut, color = input$color, clarity = input$clarity))
        
        # generate a plot of price v.s. carat under selected properties
        p <- ggplot(data = dataSelect, aes(x=carat, y=price)) + 
            geom_point() + 
            geom_smooth(method = "lm") +
            xlab("Carat of Diamond") +
            ylab("Prices") +
            labs(title = "Prices of Diamond v.s. Carats")
        p
    })
    
    output$price <- renderText({
        
        # filter the data with selected properties
        dataSelect <- filter(data, grepl(input$color, color), grepl(input$cut, cut), grepl(input$clarity, clarity))
        # linear regression model
        linearModel <- lm(price~carat, dataSelect)
        # predicted price
        pricePredict <- predict(linearModel, newdata = data.frame(carat = input$carat, cut = input$cut, color = input$color, clarity = input$clarity))
        
        result <- paste(round(pricePredict, digits = 2))
        result
    })
    
    output$cut <- renderText({
        input$cut
    })

})
