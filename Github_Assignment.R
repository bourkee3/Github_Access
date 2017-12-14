#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)
#install.packages("ggplot2")
library(ggplot2)


oauth_endpoints("github")

#based on your own auth key 
myapplication1 <- oauth_app(appname = "EB_SoftwareEngineeering",
                   key = "fa0c8e9b49c6375284a5",
                   secret = "6a1ef805225bd715acedcc0f79de6b135b5f94df")


githubToken1 <- oauth2.0_token(oauth_endpoints("github"), myapplication1)

getToken1 <- config(token = githubToken1)

#Interrogating the API

# Using user "phadej" to request data and use JSON 

phadejRequest <- GET("https://api.github.com/users/phadej/followers?per_page=100;", getToken1)
phadejRequest

stop_for_status(phadejRequest)

# Extract content from a request
extract = content(phadejRequest)

# Converting to a data.frame
githubDB = jsonlite::fromJSON(jsonlite::toJSON(extract))

# Subset data.frame
githubDB$login

# Using user "dowlind1" to request data and use JSON 

request <- GET("https://api.github.com/users/dowlind1/followers", getToken1)

#stop_for_status(request)

# Extract content from a request
extract2 = content(request)

# Converting to a data.frame
githubDB2 = jsonlite::fromJSON(jsonlite::toJSON(extract2))

# Subset data.frame
githubDB2[githubDB2$full_name == "dowlind1", "created_at"] 
githubDB2$login


#Want to extract the current users following and then extract who the current user follows
#check if there is duplication

#Get current users followers
#enter for loop to go through following
#Get who current user of the made vectors following 
#enter nested for loop to gather information about the user 
#Collect the data from each loop and place it into database


#using a single for loop to gather data from a user ie. who the follow and who their followers follow.
#including number of repositories commits etc.


data <- GET("https://api.github.com/users/khotyn/following", getToken1)
data
extract = content(data)
dataframe1 = jsonlite::fromJSON(jsonlite::toJSON(extract))
#create dataframe to place collected data 
id = dataframe1$login
id
users = c(id)

#main dataframe with data collected from interrogation of API 
userDF = data.frame(Username=integer(), Followers = integer(), Following=integer(), Repositories = integer(), DateCreated =integer(), UpdatedDate = integer())  

#create empty vectors to hold collected data
allusers = c()
#numberofrepos = c()
#totalfollowerslist = c()


#FOR loop to gather data from users following vector, user hardcoded above 
#enter for loop
for(i in 1:length(users)){
  
  #getting the current users following data using code tested above
  
  currentusername = users[i]
  url = paste("https://api.github.com/users/", currentusername, "/following",sep = "")
  following = GET( url,getToken1)
  following2 = content(following)
  
  #if user isnt following anyone move onto next username
  if(length(following2)==0){
    next
  }
  #placing the users following into a dataframe
  followingDF = jsonlite::fromJSON(jsonlite::toJSON(following2))
  followingloginName = followingDF$login

  #new for loop to get the followings followers, more data to visualise 
  
  for(j in 1:length(followingloginName)){
    
    #getting rid of dupicates within the dataframe to complete the network 
    if(is.element(followingloginName[j], allusers) == FALSE){
      
      allusers[length(allusers)+1] = followingloginName[j]
      
      #gathering the specific data for each user
      
      url2 = paste("https://api.github.com/users/", followingloginName[j],sep = "")
      followers = GET( url2,getToken1)
      followers2 = content(followers)
      followersDF = jsonlite::fromJSON(jsonlite::toJSON(followers2))
      
      #followers
      followerslist = followersDF$followers
      
      #following
      followinglist = followersDF$following
      
      #repositories
      reposlist = followersDF$public_repos
      
      #date account was created
      datecreated = substr(followersDF$created_at, start = 1, stop = 10)
      
      #date account last updated
      updatedate = substr(followersDF$updated_at, start = 1, stop = 10)
      
      #Placing the data into the main dataframe made outside the for loop
      userDF[nrow(userDF)+1,]=c(followingloginName[j], followerslist, followinglist, reposlist, datecreated, updatedate)
      
    }
    if(length(allusers) >500){
      break #creating a limit for collected data
    }
    next
  }
  if(length(allusers) >500){
    break
  }
  next
  
}

#place the dataframe into a csv file 

write.csv(userDF, 'Data.csv')


#using plotly

#use the data in the dataframe to visualise the amount of followers verses the number of following 
#visualise the number of repositories verses the number of repositories that user has
#show the date which the users account was created on each plot


