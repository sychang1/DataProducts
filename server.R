library(shiny)
library(datasets)

train <- function(choice){
    if (choice == "1")
        fit <- lm(mpg ~ am, data=mtcars)
    else if (choice == "2")
        fit <- lm(mpg ~ am + hp, data=mtcars)
    else if (choice == "3")
        fit <- lm(mpg ~ am + hp + wt, data=mtcars)
    else 
        fit <- lm(mpg ~ am + hp + wt + qsec, data=mtcars)
    fit
}

shinyServer(
    function(input,output){
    output$oText1 <- renderTable({summary(train(input$iChoice))$coef})
    
    output$myResidPlot <- renderPlot({
    if (input$iResid) {
        res <- resid(train(input$iChoice))
        qqnorm(res, main = "QQ Plot for Residuals",pch=1)
        qqline(res, col="red",lwd=1) }
    })
})