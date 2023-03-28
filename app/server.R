library(dplyr)
library(ggplot2)

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
  output$boxresponden <- renderInfoBox({
    DB <- connectDB()
    a <- "SELECT COUNT(u.id) FROM yo_user as u"
    aa <- dbGetQuery(DB, a)
    dbDisconnect(DB)
    
    infoBox(
      "Jumlah Responden", aa, icon = icon("people-group"),
      color = "light-blue"
    )
  })
  
  output$boxaskot <- renderInfoBox({
    DB <- connectDB()
    b <- "SELECT COUNT(DISTINCT(u.city_id)) FROM yo_user as u"
    bb <- dbGetQuery(DB, b)
    dbDisconnect(DB)
    
    infoBox(
      "Jumlah Kota", bb, icon = icon("house-user"),
      color = "blue"
    )
  })
  
  output$boxsurvey <- renderInfoBox({
    DB <- connectDB()
    c <- "SELECT COUNT(s.id) FROM yo_survey as s"
    cc <- dbGetQuery(DB, c)
    d <- "SELECT COUNT (n.uid_survey) FROM yo_survey_new as n"
    dd <- dbGetQuery(DB, d)
    dbDisconnect(DB)
    
    infoBox(
      "Jumlah Survey", cc + dd, icon = icon("thumbs-up"),
      color = "aqua"
    )
  })
  
  output$plot1 <- renderPlot({
    DB <- connectDB()
    
    tbluser <- dbReadTable(DB, "yo_user")
    x <- c(nrow(tbluser[tbluser$gender == "Male",]), nrow(tbluser[tbluser$gender == "Female",]))
    label <- c("Pria", "Wanita")
    piepercent<- paste(round(100*x/sum(x), 1), "%")
    pie(x, labels = piepercent, main = "Persentase Jenis Kelamin Responden")
    legend("topright", c("Pria", "Wanita"), fill = c("white", "lightblue"))
    
    dbDisconnect(DB)
  })
  
  output$plot2 <- renderPlot({
    DB <- connectDB()
    
    # table user
    tbluser <- dbReadTable(DB, "yo_user")
    
    # hitung usia
    dt1 <- tbluser %>%
      mutate(umur = as.numeric(as.Date('2022-12-24') - as.Date(tbluser$birthdate)) %/% 365)
    
    # dataframe kategori usia
    U1 <- ifelse(15 <= dt1$umur & dt1$umur <= 24, 1, 0)
    U2 <- ifelse(25 <= dt1$umur & dt1$umur <= 34, 1, 0)
    U3 <- ifelse(35 <= dt1$umur & dt1$umur <= 44, 1, 0)
    U4 <- ifelse(45 <= dt1$umur & dt1$umur <= 54, 1, 0)
    jumlah <- c(sum(U1), sum(U2), sum(U3), sum(U4))
    usia <- c("15 - 24", "25 - 34", "35 - 44", "45 - 54")
    dt2 <- data.frame(usia, jumlah)
    
    # barplot
    x <- barplot(jumlah, names.arg = usia, 
                 xlab = "Usia Responden (Tahun)", ylab = "Jumlah Responden", main = "Grafik Usia Responden",
                 col = "lightblue", ylim = c(0, 250))
    text(x, jumlah/2, labels = jumlah)
    
    dbDisconnect(DB)
  })
  
  output$user <- renderDataTable({
    DB <- connectDB()
    user <- "SELECT u.id, u.uid, u.username, u.firstname, u.lastname, u.gender, u.birthdate
              FROM yo_user as u"
    user <- dbGetQuery(DB, user)
    dbDisconnect(DB)
    
    user
  })
  
  listprov <- reactive({
   DB <- connectDB()
   prov <- dbReadTable(DB, 'yo_region_province')
   dbDisconnect(DB)
   
   prov$province
  })
  
  output$loadprov <- renderUI({
    selectInput("listprov", "Asal Provinsi", choices = listprov())
  })
  
  listkota <- reactive({
    DB <- connectDB()
    k <- "SELECT p.id_province, p.province, c.city_id, c.city
          FROM yo_region_province as p
          INNER JOIN yo_region_city as c ON p.id_province = c.province_id"
    kota <- dbGetQuery(DB, k)
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
           WHERE u.province_id = p.id_province AND u.city_id = c.city_id
                AND p.province = '", as.character(input$listprov),"'
                AND c.city = '", as.character(input$listkota), "';")
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
  
  output$point <- renderDataTable({
    DB <- connectDB()
    l <- "SELECT u.id, u.username, up.point
      FROM yo_user_point as up
      INNER JOIN yo_user as u ON u.id = up.user_id"
    lm <- dbGetQuery(DB, l)
    dbDisconnect(DB)
    
    lm
  })
}


