library(jsonlite)
library(httpuv)
library(httr)
library(dplyr)
library(tidyverse)

oauth_endpoints("github")

myapplication <- oauth_app(appname = "EBCS3012",
                   key = "ddee225589966bcbe25c",
                   secret = "997c0f014a19a6ee011832f58bfbf16e52e02653")


githubToken <- oauth2.0_token(oauth_endpoints("github"), myapplication)

getToken <- config(token = githubToken)

# Using user "phadej" to request data and use JSON 

phadejRequest <- GET("https://api.github.com/users/phadej/followers?per_page=100;", getToken)

stop_for_status(phadejRequest)

# Extract content from a request
extract = content(phadejReq)

# Converting to a data.frame
githubDB = jsonlite::fromJSON(jsonlite::toJSON(extract))

# Subset data.frame
githubDB[githubDB$full_name == "phadej", "created_at"] 
githubDB



phadejRaw<-("https://api.github.com/users/phadej/followers?per_page=100;")
data<-fromJSON(phadejRaw)
length(data)
data$login

