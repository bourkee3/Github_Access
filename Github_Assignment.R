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
extract = content(phadejRequest)

# Converting to a data.frame
githubDB = jsonlite::fromJSON(jsonlite::toJSON(extract))

# Subset data.frame
githubDB[githubDB$full_name == "phadej", "created_at"] 
githubDB



phadejRaw<-("https://api.github.com/users/phadej/followers?per_page=100;")
data<-fromJSON(phadejRaw)
length(data)
data$login

#Want to extract the current users followers and then extract who the current user follows
#then check if there is duplication or a connection between who the current user follows and their followers

#Get current users followers
#Get who current user follows
#Convert to database file in each function 
#Check for duplication or connection within the dataframes


getFollowers <- function(currentusername)
{
  #set while loop variables 
  i <- 1
  x <- 1
  
  #dataframe variable where both followers and following data will go and be checked for duplication
  followersDF <- data_frame()
  
  #Construct a while loop to gather users followers
  while(x!=0)
  {
    followerSet <- GET( paste0("https://api.github.com/users/", currentusername, "/followers?per_page=100&page=", i))
    
    followersContent <- content(followerSet)
    
    currentFollowersDF <- lapply(followersContent, function(x) 
    {
      df <- data_frame(user = x$login, userID = x$id, followersURL = x$followers_url, followingURL = x$following_url)
    }) %>% bind_rows()
    
    i <- i+1
    x <- length(followersContent)
    
    followersDF <- rbind(followersDF, currentFollowersDF)
    
    
  }
  return (followersDF)
}



getFollowing <- function(currentusername)
{
  #set while loop variables 
  i <- 1
  x <- 1
  
  #dataframe variable where both followers and following data will go and be checked for duplication
  followingDF <- data_frame()
  
  #Construct a while loop to gather users followers
  while(x!=0)
  {
    followingSet <- GET( paste0("https://api.github.com/users/", currentusername, "/following?per_page=100&page=", i))
    
    followingContent <- content(followingSet)
    
    currentFollowingDF <- lapply(followingContent, function(x) 
    {
      df <- data_frame(user = x$login, userID = x$id, followersURL = x$followers_url, followingURL = x$following_url)
    }) %>% bind_rows()
    
    i <- i+1
    x <- length(followingContent)
    
    followingDF <- rbind(followingDF, currentFollowingDF)
    
    
  }
  return (followingDF)

}

#Check if we have already saved a users details
anyConnection <- function(dataframe)
{
  noDups <- distinct(dataframe)
  return(noDups)
}

users <- data_frame()

user <- function(username)
{
  usersfollowers <- getFollowers(username)
  usersfollowing <- getFollowing(username)
  
  users <- rbind(users,usersfollowers,usersfollowing)
  
  anyDups <- anyConnection(users)
  return(anyDups)
  
}

#create a list of the data retrieved from a specific Github user

list <- user('phadej')
list




