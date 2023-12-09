library(shiny)
library(leaflet)

# Preprocess (runs once) --------------------------------------------------

shinyServer(
  function(input, output) {
    output$map <- renderLeaflet({
      
      # Dynamically select only the points corresponding to the city
      # we want explore
      sub_i <- data[data$State == input$state,]
      
      # Dyniamically select the ownership type
      check_toxic <- any(grepl("Toxic", input$checkgroup))
      check_super <- any(grepl("Super", input$checkgroup))
      if(check_toxic && check_super) sub <- sub_i
      else if(check_toxic) sub <- sub_i[sub_i$Type == "Toxic Release Inventory Facility",]
      else if(check_super) sub <- sub_i[sub_i$Type == "Superfund Site",]
      
      # Using leaflet to create the map
      leaflet() %>% addTiles()  %>% 
        addCircleMarkers(data = sub, 
                   lat = ~ latitude, 
                   lng = ~ longitude, 
                   popup = paste("Name:", sub$Name, "<br>",
                                 "Address:", sub$Address, "<br>",
                                 "Notes:", sub$Notes))
      
    })
  })