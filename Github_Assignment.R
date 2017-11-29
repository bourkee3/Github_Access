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



