library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(DT)

dashboardPage(
  title = "Profil Responden",
  dashboardHeader(
    title = span(img(src="Logo.png", width = 150))
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text = "Responden",
        tabName = "user",
        icon = icon("people-group")
      ),
      menuItem(
        text = "Asal Kota",
        tabName = "askot",
        icon = icon("house-user")
      ),
      menuItem(
        text = "Survey",
        tabName = "answer",
        icon = icon("thumbs-up")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "user", h2("Responden"),
        dataTableOutput(outputId = "user")
      ),
      tabItem(
        tabName = "askot", h2("Asal Kota Responden"),
        uiOutput("loadkota"),
        dataTableOutput(outputId = "askot")
      ),
      tabItem(
        tabName = "answer", h2("Jawaban Survey Responden"),
        uiOutput("loadquestion"),
        dataTableOutput(outputId = "answer")
      )
    )
  )
)