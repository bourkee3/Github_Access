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
githubDB$


request <- GET("https://api.github.com/users/dowlind1/followers?per_page=100;", getToken1)

stop_for_status(request)

# Extract content from a request
extract2 = content(request)

# Converting to a data.frame
githubDB2 = jsonlite::fromJSON(jsonlite::toJSON(extract2))

# Subset data.frame
githubDB2[githubDB2$full_name == "dowlind1", "created_at"] 
githubDB2$login


#Want to extract the current users followers and then extract who the current user follows
#then check if there is duplication or a connection between who the current user follows and their followers

#Get current users followers
#Get who current user follows
#Convert to database
#Check for duplication

#using a single for loop to gather data from a user ie. who the follow and who their followers follow.
#including number of repositories commits etc.


data <- GET("https://api.github.com/users/sorchaobyrne/following", getToken1)
data
extract = content(data)
dataframe1 = jsonlite::fromJSON(jsonlite::toJSON(extract))
#create dataframe to place collected data 
id = dataframe1$login
id
users = c(id)

#main dataframe with data collected from interrogation of API 
userDF = data.frame(Username=integer(), Followers = integer(), Repositories = integer())  

#create empty vectors to hold collected data
allusers = c()
#numberofrepos = c()
#totalfollowerslist = c()


#FOR loop to gather data from initial user, user hardcoded above 

for(i in 1:length(users)){
  
  #getting the current users following data using code tested above
  
  currentusername = users[i]
  url = paste("https://api.github.com/users/", currentusername, "/following",sep = "")
  following = GET( url,getToken1)
  following2 = content(following)
  followingDF = jsonlite::fromJSON(jsonlite::toJSON(following2))
  followingloginName = followingDF$login
  
  
  #if user isnt following anyone move onto next username
  if(length(following2)==0){
    next
  }
  #new for loop to get the followings followers, more data to visualise 
  
  for(j in 1:length(followingloginName)){
    
    if(is.element(followingloginName[j], allusers) == FALSE){
      
      allusers[length(allusers)+1] = followingloginName[j]
      url2 = paste("https://api.github.com/users/", followingloginName[j],sep = "")
      followers = GET( url2,getToken1)
      followers2 = content(followers)
      followersDF = jsonlite::fromJSON(jsonlite::toJSON(followers2))
      #followers
      followerslist = followersDF$followers
      #repositories
      reposlist = followersDF$public_repos
      
      userDF[nrow(userDF)+1,]=c(followingloginName[j], followerslist, reposlist)
      
    }
    if(length(allusers) >200){
      break
    }
    print(length(allusers))
    next
  }
  if(length(allusers) >200){
    break
  }
  next
  
}





