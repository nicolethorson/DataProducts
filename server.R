library(shiny)
shinyServer(function(input, output) {
  airquality$airqualitysp <- ifelse(airquality$Temp - 50 > 0, airquality$Temp - 50, 0)
  temp1 <- lm(Wind ~ Temp, data = airquality)
  temp2 <- lm(Wind ~ airqualitysp + Temp, data =airquality)
  
  wind1pred <- reactive({
    tempInput <- input$sliderTemp
    predict(temp1, newdata = data.frame(Temp = tempInput))
  })
  
  wind2pred <- reactive({
    tempInput <- input$sliderTemp
    predict(temp2, newdata = 
              data.frame(Temp = tempInput,
                         airqualitysp = ifelse(tempInput - 50 > 0,
                                        tempInput - 50, 0)))
  })
  output$plot1 <- renderPlot({
    tempInput <- input$sliderTemp
    
    plot(airquality$Temp, airquality$Wind, xlab = "Temperature", 
         ylab = "Wind Speed", bty = "n", pch = 16,
         xlim = c(50, 100), ylim = c(0, 25))
    if(input$showWind1){
      abline(temp1, col = "red", lwd = 2)

    }
    legend(25, 250, c("Wind Prediction from Selection"), pch = 16, 
           col = c("red"), bty = "n", cex = 1.2)
    points(tempInput, wind1pred(), col = "red", pch = 16, cex = 2)

  })
  
  output$pred1 <- renderText({
    wind1pred()
  })

  })
