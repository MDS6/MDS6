connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  DB <- dbConnect(
    driver,
    dbname = "kbelwajw",
    host = "topsy.db.elephantsql.com",
    user = "kbelwajw",
    password = "KXqFCmA_-crI7yFjYYzOp3Sqj-2JhOfk")
  
}

function(input, output, session) {
  output$user <- renderDataTable({
    DB <- connectDB()
    user <- dbReadTable(DB, 'yo_user')
    dbDisconnect(DB)
    
    user
  })

  listkota <- reactive({
    DB <- connectDB()
    kota <-dbReadTable(DB, 'yo_region_city')
    dbDisconnect(DB)
    
    kota$city
  })
  
  output$loadkota <- renderUI({
    selectInput("listkota", "Asal Kota", choices = listkota())
  })
  
  output$askot <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT u.id, u.uid, u.username, p.province, c.city
           FROM yo_user AS u, yo_region_city AS c, yo_region_province AS p
           WHERE u.province_id = p.id_province AND u.city_id = c.city_id AND c.city = '", as.character(input$listkota), "';")
    rs <- dbGetQuery(DB, q)  
    
    dbDisconnect(DB)
    
    rs
  })

  listquestion <- reactive({
    DB <- connectDB()
    svy <-dbReadTable(DB, 'yo_survey')
    dbDisconnect(DB)
    
    svy$question
  })
  
  output$loadquestion <- renderUI({
    selectInput("listquestion", "Pertanyaan", choices = listquestion())
  })
  
  output$answer <- renderDataTable({
    DB <- connectDB()
    p <- paste0("SELECT s.id, u.id, u.username, a.answer
           FROM yo_user AS u, yo_survey_answer AS a, yo_survey AS s
           WHERE s.id = a.survey_id AND a.user_id = u.id AND s.question = '", as.character(input$listquestion), "';")
    sy <- dbGetQuery(DB, p)  
    
    dbDisconnect(DB)
    
    sy
  })
}


