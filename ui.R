#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data("airquality")
shinyUI(fluidPage(
  titlePanel("Predict Wind Speed from Temperature"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderTemp", "What is the Temperature?", 50, 100, value = 70),
      checkboxInput("showWind1", "Show/Hide Wind Speed1", value = TRUE)
     
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Wind Speed from Temperature Chosen:"),
      textOutput("pred1")
    )
  )
))
