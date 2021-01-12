ui <- fluidPage(useShinyalert(),
  img(src = "logo_25anos_web.png", height = 50, width = 140),
sidebarLayout(sidebarPanel(tabsetPanel(
  tabPanel("Capa", selectInput("inSelect", 
  "", 
  c("Región"="REGION","Provincia"="PROVINCIA","Comuna"="COMUNA","Distrito"="DC","Localidad / Zona"="ZC_LOC"),selected = "ZC_LOC"),
  #checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
  #                   choices = list("Región I" = 1, "Región II" = 2, "Región III" = 3, "Región IV" = 4, "Región V" = 5,
  #                                  "Región Metropolitana" = 13, "Región VI" = 6, "Región VII" = 7, "Región VIII" = 8, "Región IX" = 9, 
  #                                  "Región X" = 10, "Región XI" = 11, "Región XII" = 12, "Región XIV" = 14, "Región XV" = 15, "Región XIV" = 16),
  #                   selected = NULL),
           img(src = "k.png", height = 220, width = 300)
           ),
  tabPanel("Instrucciones", p("Utiliza las opciones al costado izquierdo del mapa para 
           dibujar un polígono, tienes que presionar solo una vez y después dibujarlo 
           marcando sus vértices."), 
           p("Para cerrarlo solo presiona el primer punto que marcaste. 
           Una vez dibujado el polígono, presiona la tecla para descargar archivo."), 
           p("Si quieres sacar un informe nuevo, presiona el tacho de basura y dale
           a la opción 'Clear All', luego repite el procedimiento desde el comienzo."),
           img(src = "k2.png", height = 200, width = 360)
           )
)),
  mainPanel(leafletOutput("mymap"),
            
            shinyjs::useShinyjs(),
            actionButton("init", "Descargar informe", icon = icon("download")),
            downloadButton("downloadData", "Descargar archivo", style = "visibility: hidden;"),
            fileInput("file", "Cargar .shp / .kml",accept = c(".shp",".kml"),buttonLabel = "Examinar", placeholder = "No se ha cargado el archivo"),
            checkboxInput("info", "Incluir plantilla de informe", value = T))
))