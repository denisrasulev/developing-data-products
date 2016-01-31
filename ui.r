# ui.r

# define the overall UI
shinyUI(
    # use a fluid bootstrap layout
    fluidPage(
        # set application title (two lines) and window title for browser
        titlePanel(h1("Kazakhstan Population", align = "center"), windowTitle = "Kazakhstan"),
        titlePanel(h3("changes by time, region and type", align = "center")),
        br(),
        # generate a row with a sidebar
        sidebarLayout(
            # set position of the sidebar to "left" or "right"
            position = "left",
            # sidebar panel area
            sidebarPanel(
                # print title and some text
                h3("Filter"),
                br(),
                # set input field(s)
                sliderInput("in.year", "Select year / range:",
                            min = 2009,
                            max = 2015,
                            value = c(2012,2015),
                            ticks = TRUE,
                            sep = ""),
                h6("Move sliders left / right to set desired range or put one on other to select single year."),
                br(),
                selectInput("in.region", "Select region:", choices = df$region, selected = "Kazakhstan"),
                h6("Select one region from drop-down list."),
                br(),
                radioButtons("in.type", "Select population type:",
                                   c("Urban" = "urban",
                                     "Rural" = "rural",
                                     "Total" = "total"),
                                    selected = "Rural"),
                h6("Select one population type"),
                br(),
                h6("© 2016 Denis Rasulev"),
                h6("All Rights Reserved.")
            ),
            # main panel area
            mainPanel(
                #br(),
                img(src="flag.png", heigth = 100, width = 200),
                img(src="location.jpg", heigth = 100, width = 200),
                # set title
                h3("Plot of population changes"),
                # text outputs
                textOutput("out.year"),
                textOutput("out.region"),
                br(),
                # plot output
                plotOutput("plot")
            )
        )
    )
)
