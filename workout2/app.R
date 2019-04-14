#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Money Balance"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     column(4,
            sliderInput("initial",
                        "Initial Amount",
                        min = 0,
                        max = 100000,
                        step = 500,
                        value = 1000,
                        pre = '$')
     ),
     column(4,
            sliderInput('return','Return Rate (in %)',min = 0,max = 20,step = 0.1,value = 5)
     ),
     column(4,
            sliderInput('year','Years',min = 0,max=50,step = 1,value = 10)
     )
   ),
   fluidRow(
     column(4,
            sliderInput('contribution',
                        'Annual Contribution',
                        min = 0,
                        max = 50000,
                        step = 500,
                        value = 2000,
                        pre = '$')
     ),
     column(4,
            sliderInput('growth','Growth Rate (in %)',min = 0,max = 20,step = 0.1,value = 2)
     ),
     column(4,
            selectInput('facet','Facet?',choices = c('No','Yes'),selected = 'No')
     )
   ),
          h4('Timelines'),
          plotOutput('Timelines'),
   h4('Balances'),
          tableOutput('Balances')) 
      

      
    

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$Timelines =  renderPlot(
    {
      initial = input$initial
      year = input$year
      growth = input$growth/100
      return = input$return/100
      contribution = input$contribution
      facet = input$facet
      
      #
      future_value = function(amount, rate, years) {
        fv = amount*(1+rate)^years
        return(fv)
      }
      #
      annuity = function(contrib, rate, years) {
        fv = contrib*((1+rate)^years-1)/rate
        return(fv)
        
      }
      #
      growing_annuity = function(contrib, rate, growth, years) {
        fv = contrib*((1+rate)^years-(1+growth)^years)/(rate-growth)
        return(fv)
      }
      
      #
      # 
      no_contrib = rep(initial,year+1)
      for (i in 2:(year+1)) {
        no_contrib[i] =  future_value(amount = initial, rate = return, years = i-1)
      }
      
      
      fixed_contrib = rep(initial,year+1)
      for (i in 2:(year+1)) {
        fixed_contrib[i]  = future_value(initial, return, i-1)+annuity(contribution, return,i-1)
      }
      
  
      growing_contrib = rep(initial,year+1)
      for (i in 2:(year+1)) {
        growing_contrib[i] = future_value(initial,return,i-1) + growing_annuity(contribution, return,growth, i-1)
      }
      
      #
          dat = data.frame(
        balance = c(no_contrib,fixed_contrib,growing_contrib),
        year = rep(0:year,3),
        modality = c(rep("no_contrib", year+1), rep("fixed_contrib",year+1), rep("growing_contrib",year+1))
      )
          dat$modality = factor(dat$modality, levels = c('no_contrib','fixed_contrib','growing_contrib'))
          
      library(ggplot2)
      if(facet == 'Yes') {
       gg= ggplot(dat)+
        geom_point(aes(x = year,  y = balance, color = modality), cex = 0.5)+
        geom_line(aes(x = year, y = balance,color = modality))+
         geom_area(aes(x = year, y = balance,fill = modality),alpha = 0.5)+
        facet_wrap(~modality)+
        theme_bw()+
        labs(x = 'year', y = 'value',title = 'Three models of investing')
      } else {
        gg = ggplot(dat)+
          geom_point(aes(x = year,  y = balance, color = modality), cex = 2)+
          geom_line(aes(x = year, y = balance,color = modality),cex = 0.8)+
          labs(x = 'year', y = 'value',title = 'Three models of investing')
      }
      gg
})
  output$Balances = renderTable({ 
    initial = input$initial
    year = input$year
    growth = input$growth/100
    return = input$return/100
    contribution = input$contribution
    facet = input$facet
    
    #
    future_value = function(amount, rate, years) {
      fv = amount*(1+rate)^years
      return(fv)
    }
    #
    annuity = function(contrib, rate, years) {
      fv = contrib*((1+rate)^years-1)/rate
      return(fv)
      
    }
    #
    growing_annuity = function(contrib, rate, growth, years) {
      fv = contrib*((1+rate)^years-(1+growth)^years)/(rate-growth)
      return(fv)
    }
    
    #
    # 
    no_contrib = rep(initial,year+1)
    for (i in 2:(year+1)) {
      no_contrib[i] =  future_value(amount = initial, rate = return, years = i-1)
    }
    
    
    fixed_contrib = rep(initial,year+1)
    for (i in 2:(year+1)) {
      fixed_contrib[i]  = future_value(initial, return, i-1)+annuity(contribution, return,i-1)
    }
    
    
    growing_contrib = rep(initial,year+1)
    for (i in 2:(year+1)) {
      growing_contrib[i] = future_value(initial,return,i-1) + growing_annuity(contribution, return,growth, i-1)
    }
    
    a = data.frame(
      year = 0:year,
      no_contrib = no_contrib,
      fixed_contrib = fixed_contrib,
      growing_contrib = growing_contrib
    )
    a}
   
  )
  
}

# Run the application 
shinyApp(ui = ui, server = server)

