library(shiny)

shinyServer(function(input, output, session) {
    
    BMI <- reactive({
        Bmi <- as.numeric(input$weight)/(as.numeric(input$height)/100)^2
    })

    output$BMI <- renderText({
        BMI()
    })
    
    output$Result1 <- renderText({
        if (BMI() < 18.5){
            result <- "Underweight"
        } else if (BMI() < 24.9){
            result <- "Normal weight."
        } else if (BMI() < 29.9){
            result <- "Overweight"
        } else if (BMI() >= 30){
            result <- "Obesity"
        }
    })
    
    output$Result2 <- renderText({
        if (BMI() < 18.5){
            result <- "Your BMI suggests you are underweight."
        } else if (BMI() < 24.9){
            result <- "Fantastic! Your BMI indicates you are a healthy weight for your height."
        } else if (BMI() < 29.9){
            result <- "Your BMI suggests you may be at risk of developing weight-related problems."
        } else if (BMI() >= 30){
            result <- "Your BMI suggests your health is at great risk from weight-related problems, including heart disease and diabetes."
        }
    })
    
    url <- a("National Heart, Lung and Blood Institue", href="https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmi-m.htm")
    output$url <- renderUI({
        tagList("URL link:", url)
    })
})
