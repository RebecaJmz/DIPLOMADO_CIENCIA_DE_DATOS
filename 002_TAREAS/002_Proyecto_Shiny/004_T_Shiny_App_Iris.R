#Librerías
library(shiny)
library(ggplot2)
library(gridExtra)


# Interfaz de usuario
ui<- fluidPage(

#Título de proyecto  
titlePanel("Visualización de la Base de Datos Iris de acuerdo con la Especie"),
  
#Panel izquierdo
sidebarPanel(
    selectInput('Species', 'Selecciona la especie', as.character(unique(iris$Species))),
  ),
  
#Panel principal
mainPanel(
    
    tabsetPanel(type="tab",
                tabPanel("HISTOGRAMA", plotOutput('plot1',width = 800, height = 600)),
                tabPanel("BOXPLOT", plotOutput('plot2',width = 800, height = 600)),
                tabPanel("DENSIDAD", plotOutput('plot3',width = 800, height = 600)),
                tabPanel("RESUMEN Y DATOS", verbatimTextOutput("summary"),dataTableOutput('table')),
                
    )
    
    
  )
)

#Definición de elementos y funciones
server<-function(input, output) {
  
  data <- reactive({iris[iris$Species == input$Species,]})
  
  output$table <- renderDataTable(data())
  
  
  output$plot1 <- renderPlot({
    
    #Graf.1 Histograma Sepal Length 
    g1 <- ggplot(data(), aes(Sepal.Length))
    g1 <- g1 + geom_histogram(binwidth = .5, fill="green", color = "black",alpha = .2)
    g1 <- g1 + geom_vline( aes(xintercept = mean(data()$Sepal.Length)), colour="red", size=2, alpha=.6)
    g1 <- g1 + labs(x = "Sepal Length")
    g1 <- g1 + labs(y = "Frequencia")
    g1 <- g1 + labs(title = paste("Distribución Sepal Length, m=", round(mean(data()$Sepal.Length),2)))
    
    #Graf.2 Histograma Sepal Width
    g2 <- ggplot(data(), aes(Sepal.Width))
    g2 <- g2 + geom_histogram(binwidth = .5, fill="green", color = "black",alpha = .2)
    g2 <- g2 + geom_vline( aes(xintercept = mean(data()$Sepal.Width)), colour="red", size=2, alpha=.6)
    g2 <- g2 + labs(x = "Sepal Width")
    g2 <- g2 + labs(y = "Frequencia")
    g2 <- g2 + labs(title = paste("Distribución Sepal Width, m=", round(mean(data()$Sepal.Width),2)))
    
    #Graf.3 Histograma Petal Length
    g3 <- ggplot(data(), aes(Petal.Length))
    g3 <- g3 + geom_histogram(binwidth = .5, fill="yellow", color = "black",alpha = .2)
    g3 <- g3 + geom_vline( aes(xintercept = mean(data()$Petal.Length)), colour="red", size=2, alpha=.6)
    g3 <- g3 + labs(x = "Petal Length")
    g3 <- g3 + labs(y = "Frequencia")
    g3 <- g3 + labs(title = paste("Distribución Petal Length, m=", round(mean(data()$Petal.Length),2)))
    
    #Graf.4 Histograma Petal Width
    g4 <- ggplot(data(), aes(Petal.Width))
    g4 <- g4 + geom_histogram(binwidth = .5, fill="yellow", color = "black",alpha = .2)
    g4 <- g4 + geom_vline( aes(xintercept = mean(data()$Petal.Width)), colour="red", size=2, alpha=.6)
    g4 <- g4 + labs(x = "Petal Width")
    g4 <- g4 + labs(y = "Frequencia")
    g4 <- g4 + labs(title = paste("Distribución Petal Width, m=", round(mean(data()$Petal.Width),2)))
    
    # Área de gráficos
    grid.arrange(g1,g2,g3,g4,nrow=2, ncol=2)
  })
  
  output$plot2 <- renderPlot({
    
    #Graf. 1 Boxplot Sepal Length 
    g1 <- ggplot(data(), aes(Sepal.Length))
    g1 <- g1 + geom_boxplot(fill="green")+theme_bw()
    g1 <- g1 + labs(title = paste("Sepal Length, m=", round(mean(data()$Sepal.Length),2)))
    
    #Graf. 2 Boxplot Sepal Width
    g2 <- ggplot(data(), aes(Sepal.Width))
    g2 <- g2 + geom_boxplot(fill="green")+theme_bw()
    g2 <- g2 + labs(title = paste("Sepal Width, m=", round(mean(data()$Sepal.Width),2)))
    
    #Graf. 3 Boxplot Petal Length
    g3 <- ggplot(data(), aes(Petal.Length))
    g3 <- g3 + geom_boxplot(fill="yellow")+theme_bw()
    g3 <- g3 + labs(title = paste("Petal Length, m=", round(mean(data()$Petal.Length),2)))
    
    #Graf. 4 Boxplot Petal Width
    g4 <- ggplot(data(), aes(Petal.Width))
    g4 <- g4 + geom_boxplot(fill="yellow")+theme_bw()
    g4 <- g4 + labs(title = paste("Petal Width, m=", round(mean(data()$Petal.Width),2)))
    
    # Área de gráficos
    grid.arrange(g1,g2,g3,g4,nrow=2, ncol=2)
  })
  
  
  output$plot3 <- renderPlot({
    
    #Graf. 1 Densidad Sepal Length 
    g1 <- ggplot(data(), aes(Sepal.Length))
    g1 <- g1 + geom_density( fill="green",position = "identity",alpha = 0.5)
    g1 <- g1 + labs(title = paste("Sepal Length, m=", round(mean(data()$Sepal.Length),2)))
    
    #Graf. 2 Densidad Sepal Width
    g2 <- ggplot(data(), aes(Sepal.Width))
    g2 <- g2 + geom_density( fill="green",position = "identity",alpha = 0.5)
    g2 <- g2 + labs(title = paste("Sepal Width, m=", round(mean(data()$Sepal.Width),2)))
    
    #Graf. 3 Densidad Petal Length
    g3 <- ggplot(data(), aes(Petal.Length))
    g3 <- g3 + geom_density( fill="yellow",position = "identity",alpha = 0.5)
    g3 <- g3 + labs(title = paste("Petal Length, m=", round(mean(data()$Petal.Length),2)))
    
    #Graf. 4 Densidad Petal Width
    g4 <- ggplot(data(), aes(Petal.Width))
    g4 <- g4 + geom_density( fill="yellow",position = "identity",alpha = 0.5)
    g4 <- g4 + labs(title = paste("Petal Width, m=", round(mean(data()$Petal.Width),2)))
    
    # Área de gráficos
    grid.arrange(g1,g2,g3,g4,nrow=2, ncol=2)
  })
  
  
  # Salida de datos estadísticos
  output$summary<-renderPrint({
                                summary(data())
                             })
  
}

#Ejecutar el proyecto
shinyApp(ui = ui, server = server)
