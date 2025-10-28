library(shiny)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(plotly)
library(DT)

# --- LOAD DATA ---
data("names_data", package = "Assessment4")

names_data <- names_data |>
  mutate(name = reorder(name, per_1000))

# --- UI ---
ui <- fluidPage(
  titlePanel("Most Common First Names (Per 1,000 Americans as of 2013)"),

  tabsetPanel(
    tabPanel("Interactive Plot",
             sidebarLayout(
               sidebarPanel(
                 selectInput("gender", "Select Gender:",
                             choices = c("All", "Male", "Female"),
                             selected = "All"),
                 selectInput("sort_order", "Sort by:",
                             choices = c("Descending" = "desc", "Ascending" = "asc"),
                             selected = "desc")
               ),
               mainPanel(
                 plotlyOutput("name_plot"),
                 tags$hr(),
                 tags$p("Source: Social Security Administration, U.S. Census Bureau | Graphic inspired by FiveThirtyEight")
               )
             )
    ),

    tabPanel("View Data",
             fluidRow(
               column(12,
                      h4("Raw Dataset"),
                      DTOutput("data_table")
               )
             )
    )
  )
)


server <- function(input, output) {

  output$name_plot <- renderPlotly({
    filtered_data <- names_data %>%
      filter(if (input$gender == "All") TRUE else gender == input$gender)

    filtered_data <- filtered_data %>%
      mutate(name = if (input$sort_order == "desc")
        reorder(name, per_1000)
        else
          reorder(name, -per_1000))

    p <- ggplot(filtered_data, aes(x = name, y = per_1000, fill = gender, text = paste0(name, ": ", per_1000))) +
      geom_bar(stat = "identity") +
      coord_flip() +
      scale_fill_manual(values = c("Male" = "#4C90D1", "Female" = "#EFB748")) +
      labs(x = NULL, y = "Per 1,000 Americans", fill = NULL) +
      theme_fivethirtyeight() +
      theme(
        axis.text.y = element_text(size = 11, color = "black"),
        legend.position = "none"
      )

    ggplotly(p, tooltip = "text")
  })

  output$data_table <- renderDT({
    datatable(names_data, options = list(pageLength = 10), rownames = FALSE)
  })
}


shinyApp(ui = ui, server = server)
