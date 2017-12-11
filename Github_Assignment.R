library(jsonlite)
library(httpuv)
library(httr)
library(dplyr)
library(tidyverse)

oauth_endpoints("github")

myapplication1 <- oauth_app(appname = "EB_SoftwareEngineeering",
                   key = "fa0c8e9b49c6375284a5",
                   secret = "6a1ef805225bd715acedcc0f79de6b135b5f94df")


githubToken1 <- oauth2.0_token(oauth_endpoints("github"), myapplication1)

getToken1 <- config(token = githubToken)

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
#Convert to database
#Check for duplication

#using a single for loop to gather data from a user ie. who the follow and who their followers follow.
#including number of repositories commits etc.

data <- GET("https://api.github.com/users/phadej/followers?per_page=100;", getToken)
extract = content(data)
dataframe1 = jsonlite::fromJSON(jsonlite::toJSON(extract))
#create dataframe to place collected data 
id = dataframe1$login
users = c(id)

#main dataframe with data collected from interrogation of API 
userDF = data.frame(Username=integer(), Followers = integer(), Repositories = integer())  

allusers = c()
numberofrepos = c()
totalfollowerslist = c()

#FOR loop to gather data from initial user, user hardcoded above 

for(i in 1:length(users)){
  
  #getting the current users following data using code tested above
  
  currentusername = users[i]
  url = paste("https://api.github.com/users/", currentusername, "/following?per_page=100&page=")
  following = GET( url,getToken)
  following2 = content(following)
  
  #if user isnt following anyone move onto next username
  if(length(following2)=0){
    next
  }
  
  followingDf = jsonlite::fromJSON(jsonlite::toJSON(following2))
  followingloginName = followingDf$login
  
  #new for loop to get the followings followers, more data to visualise 
  
  
  
    
}



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
    followerSet <- GET( paste0("https://api.github.com/users/", currentusername, "/followers?per_page=100&page=", i),getToken)
    
    followersContent <- content(followerSet)
    
    currentFollowersDF <- lapply(followersContent, function(x) 
    {
      dataframe <- data_frame(user = x$login, userID = x$id, followersURL = x$followers_url, followingURL = x$following_url)
    }) %>% bind_rows()
    
    i <- i+1
    x <- length(followersContent)
    
    followersDF <- rbind(followersDF, currentFollowersDF)
    
    
  }
  return (followersDF)
}

getFollowers(phadej)

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
    followingSet <- GET( paste0("https://api.github.com/users/", currentusername, "/following?per_page=100&page=", i),getToken)
    
    followingContent <- content(followingSet)
    
    currentFollowingDF <- lapply(followingContent, function(x) 
    {
      dataframe <- data_frame(user = x$login, userID = x$id, followersURL = x$followers_url, followingURL = x$following_url)
    }) %>% bind_rows()
    
    i <- i+1
    x <- length(followingContent)
    
    followingDF <- rbind(followingDF, currentFollowingDF)
    
    
  }
  return (followingDF)

}

#New function to get the repositories of the username entered 

getRepos <- function(currentusername)
{
  i <- 1
  x <- 1
  
  reposDF <- data_frame()#new empty dataframe to fill with repositories
  
  while(x!=0)
  {
    repository <- GET( paste0("https://api.github.com/users/", currentusername, "/repos?per_page=100&page=", i),getToken)
    reposContent <- content(repository)
    
    currentReposDF <- lapply(reposContent, function(x) 
    {
      dataframe <- data_frame(repo = x$name, id = x$id, commits = x$git_commits_url)#information i want from the repositories
    }) %>% bind_rows()
    
    i <- i+1 #iterate for the while loop
    
    x <- length(reposContent)
    reposDF <- rbind(reposDF, currentReposDF)
  }
  return (reposDF)
}








