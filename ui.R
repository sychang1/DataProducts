shinyUI(pageWithSidebar(
    headerPanel("Miles Per Gallon: 1974 Motor Trend data"),
    sidebarPanel(
    radioButtons("iChoice", "Regression formula :",
                       choices = c("mpg ~ am" = "1",
                         "mpg ~ am + hp" ="2",
                         "mpg ~ am + hp + wt" = "3",
                         "mpg ~ am + hp + wt + qsec" = "4"),
                       selected = c("1")),
    checkboxInput("iResid",
                  strong("Show residual plot"),
                  value = FALSE),
    submitButton("GO", width=100)),
    mainPanel(
              # Simple Introductory Remarks.
              h4("About:"),
              p("This app analyzes the impact of a set of variables on the miles per gallon (MPG) of various car models
                 from the 1974 Motor Trend magazine data set."),
              p("It is very simple to use this app: on the left sidebar panel, you can pick the linear regression formula and decide whether
                to plot the residual distribution or not. Then press GO to apply. The result is shown below."),
              
              p(a("More detailed information here.", href="https://github.com/sychang1/DataProducts")),
              
              h4("Output:"),
              tableOutput("oText1"),
              # Dispaly this only when Residual button is checked.
              plotOutput("myResidPlot",width = "400px", height = "300px"))
                
))