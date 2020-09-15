library(shiny)

library(tidyverse); library(maps); library(here)
source(here("src", "visualizeDB.R"))
load(here("results", "appdata.RData"))
spp <- WoSDB %>% select(TPLName) %>% arrange(TPLName) %>% pull(TPLName) %>% unique %>% as.character

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("SylvanSeeds: Germination database of temperate broadleaf and mixed forests"),

    # Sidebar to choose species to display
    sidebarLayout(
         sidebarPanel(helpText("Select a species to display germination records."),
            selectInput("var",
                        label = "Species:",
                        choices = spp,
                        selected = spp[1])
        ),

        # Show a plot of the germination records
        mainPanel(
           plotOutput("plot_map"),
           plotOutput("plot_germination"),
           tableOutput("table")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$plot_map <- renderPlot({
        # filter by species
        x  <- filtrar(Places, input$var)
        
        # draw the map for the species
        mapplot(df = x, shape = TBMF)
    })
    
    output$plot_germination <- renderPlot({
        # filter by species
        y  <- filtrar(Germination, input$var)
        
        # draw the germination plot for the species
        seedplot(df = y)
    })
    output$table <- renderTable({
        references(WoSDB, input$var)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
