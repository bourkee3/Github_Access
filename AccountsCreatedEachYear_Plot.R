# Get this figure: fig <- get_figure("bourkee3", 5)
# Get this figure's data: data <- get_figure("bourkee3", 5)$data
# Add data to this figure: p <- add_trace(p, x=c(4, 5), y=c(4, 5), kwargs=list(filename="Plot 5", fileopt="extend"))
# Get y data of first trace: y1 <- get_figure("bourkee3", 5)$data[[1]]$y

# Get figure documentation: https://plot.ly/r/get-requests/
# Add data documentation: https://plot.ly/r/file-options/

# You can reproduce this figure in R with the following code!

# Learn about API authentication here: https://plot.ly/r/getting-started
# Find your api_key here: https://plot.ly/settings/api

library(plotly)
trace1 <- list(
  x = c("YearCreated", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"), 
  y = c("Users", "2", "203", "104", "74", "31", "20", "9", "13", "3", "3", "0"), 
  marker = list(
    color = "rgb(236, 135, 48)", 
    line = list(
      color = "rgb(249, 249, 249)", 
      width = -0.5
    )
  ), 
  name = "J", 
  orientation = "v", 
  type = "bar", 
  uid = "0bf5df", 
  xsrc = "bourkee3:2:39840c", 
  ysrc = "bourkee3:2:9a7ee2"
)
data <- list(trace1)
layout <- list(
  bargap = 0.21, 
  bargroupgap = 0, 
  font = list(
    family = "Roboto", 
    size = 14
  ), 
  hovermode = "closest", 
  plot_bgcolor = "rgb(255, 255, 255)", 
  title = "<b>Number of User Accounts Created each Year (from Data.csv)</b>", 
  titlefont = list(
    family = "Balto", 
    size = 20
  ), 
  xaxis = list(
    autorange = TRUE, 
    range = c(2006.5, 2017.5), 
    title = "<b>Year</b>", 
    type = "linear"
  ), 
  yaxis = list(
    autorange = TRUE, 
    range = c(0, 213.684210526), 
    title = "<b>Users</b>", 
    type = "linear"
  )
)
p <- plot_ly()
p <- add_trace(p, x=trace1$x, y=trace1$y, marker=trace1$marker, name=trace1$name, orientation=trace1$orientation, type=trace1$type, uid=trace1$uid, xsrc=trace1$xsrc, ysrc=trace1$ysrc)
p <- layout(p, bargap=layout$bargap, bargroupgap=layout$bargroupgap, font=layout$font, hovermode=layout$hovermode, plot_bgcolor=layout$plot_bgcolor, title=layout$title, titlefont=layout$titlefont, xaxis=layout$xaxis, yaxis=layout$yaxis)
