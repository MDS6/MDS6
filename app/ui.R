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
        text = "Dashboard",
        tabName = "dashboard",
        icon = icon("database")
      ),
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
      ),
      menuItem(
        text = "Point Survey",
        tabName = "point",
        icon = icon("lightbulb")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "dashboard", h2("Dashboard"),
        fluidPage(
          fluidRow(
            infoBoxOutput("boxresponden"),
            infoBoxOutput("boxaskot"),
            infoBoxOutput("boxsurvey")
          ),
          fluidRow(
            column(plotOutput("plot1"), width = 6),
            column(plotOutput("plot2"), width = 6)
          )
        )
      ),
      tabItem(
        tabName = "user", h2("Responden"),
        dataTableOutput(outputId = "user")
      ),
      tabItem(
        tabName = "askot", h2("Asal Kota Responden"),
        fluidPage(
          fluidRow(
            column(uiOutput("loadprov"), width = 6),
            column(uiOutput("loadkota"), width = 6)
          ),
          fluidRow(
            dataTableOutput(outputId = "askot")
          )
        )
      ),
      tabItem(
        tabName = "answer", h2("Jawaban Survey Responden"),
        uiOutput("loadquestion"),
        dataTableOutput(outputId = "answer")
      ),
      tabItem(
        tabName = "point", h2("Point Responden"),
        dataTableOutput(outputId = "point")
      )
    )
  )
)
