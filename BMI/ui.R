library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Calculate your Body Mass Index"),
    h4("Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women."),
    
    
    # Sidebar with two textInput 
    sidebarLayout(
        
        sidebarPanel(
            textInput("weight", "Enter your weight in Kg:", value = "67.8"),
            textInput("height", "Enter your height in cm:", value = "170"),
            submitButton("Calculate BMI")
        ),
        
        # Include two tabs: the first one for the BMI results, the second one with some BMI information
        mainPanel(
            tabsetPanel(
                tabPanel("BMI", br(),
                        h4("Your BMI is:"),
                        h4(textOutput("BMI")),
                        h4(textOutput("Result1")),
                        textOutput("Result2")),
                        
                tabPanel("Controlling your Weight", br(), 
                         h3("Why is a Healthy Weight Important?"),
                         h5("Reaching and maintaining a healthy weight is important for overall health and can help you prevent and control many diseases and conditions. If you are overweight or obese, you are at higher risk of developing serious health problems, including heart disease, high blood pressure, type 2 diabetes, gallstones, breathing problems, and certain cancers. That is why maintaining a healthy weight is so important: It helps you lower your risk for developing these problems, helps you feel good about yourself, and gives you more energy to enjoy life."),
                         h3("What Is Overweight and Obesity?"),
                         h5("Overweight is having extra body weight from muscle, bone, fat, and/or water. Obesity is having a high amount of extra body fat. Body mass index (BMI) is a useful measure of overweight and obesity. The information on this WebApp  will provide you with information about the limitations of BMI. Talk to your health care provider if you are concerned about your BMI.")),

                tabPanel("Limitations of the BMI", br(), 
                         h5("BMI is a useful measure of overweight and obesity. It is calculated from your height and weight. BMI is an estimate of body fat and a good gauge of your risk for diseases that can occur with more body fat. The higher your BMI, the higher your risk for certain diseases such as heart disease, high blood pressure, type 2 diabetes, gallstones, breathing problems, and certain cancers."),
                         h5("Although BMI can be used for most men and women, it does have some limits:"),
                         h5("- It may overestimate body fat in athletes and others who have a muscular build."),
                         h5("- It may underestimate body fat in older persons and others who have lost muscle.")),             
                         
                tabPanel("Source", br(), 
                        h4("This information has been adapted from the website:"),
                        uiOutput("url"))          
                        )
        )
    )
))