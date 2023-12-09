library(shiny)
library(leaflet)

shinyUI(
  bootstrapPage(
    tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
    leafletOutput("map", width = "100%", height = "100%"),
    absolutePanel(top = 40, left = 10, draggable = T,
                  h1("US Cancer Facilities & Providers map"),
                  h4("Instructions:"),
                  p("Type in the box below the name of the State you want to
                    explore.", br(), 
                    "Click and drag to move the map.", br(),
                    "The + and - buttons
                    in the top left corner allow for zooming.", br(),
                    "This same panel containing the selectors,", br(),
                    "can be dragged around.", br(),
                    "Clicking on the markers on the map opens,", br(),
                    "up a popup with extra info on the cancer location."), 
                  selectInput("state", "Select Name",
                              unique(data$State),
                              selected = "VA"
                  ),
                  checkboxGroupInput("checkgroup",
                                     "Select type",
                                     choices = list(
                                       "Toxic Release Inventory Facility" = "Toxic",
                                       "Superfund Site" = "Super"
                                     ),
                                     selected = c("Toxic", "Super")),style = "background: rgb(54, 25, 25); /* Fall-back for browsers that don't
                                    support rgba */
                  background: rgba(54, 25, 25, .5);font-family: 'Lobster', cursive;
                  font-weight: 500; line-height: 1.1; 
                  color: #F5F5F5;"
    )
    
    )
  
)