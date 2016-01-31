#server.r
df <- read.csv("data/data.csv", stringsAsFactors = FALSE)

# load shiny package
library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {
        # create text output
        output$out.year   <- renderText({
            paste("Selected period: From ", input$in.year[1], "to ", input$in.year[2])})
        output$out.region <- renderText({
            paste("Selected region: ", input$in.region)})
        # create plot output
        output$plot       <- renderPlot({
            # select values according to user inputed values
            ch <- subset(
                df,
                region == input$in.region  &
                type   == input$in.type    &
                year   >= input$in.year[1] &
                year   <= input$in.year[2],
                select = c(year, population))
            # create plot with selected results
            ggplot(ch, aes(ch$year, ch$population)) +
                geom_point(aes(size = population)) +
                geom_smooth(method = "loess", se = FALSE) +
                coord_cartesian() +
                scale_color_gradient() +
                labs(x = "Year", y = "Population")
        })
    }
)
