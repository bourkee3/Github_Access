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
githubDB[githubDB$full_name == "phadej", "created_at"] 
githubDB



phadejRaw<-("https://api.github.com/users/phadej/followers?per_page=100;")
data2<-fromJSON(phadejRaw)
length(data2)
data2$login

request <- GET("https://api.github.com/users/dowlind1/followers?per_page=100;", getToken1)

stop_for_status(request)

# Extract content from a request
extract2 = content(request)

# Converting to a data.frame
githubDB2 = jsonlite::fromJSON(jsonlite::toJSON(extract2))

# Subset data.frame
githubDB2[githubDB2$full_name == "dowlind1", "created_at"] 
githubDB2



jRaw<-("https://api.github.com/users/dowlind1/followers?per_page=100;")
data3<-fromJSON(jRaw)
length(data3)
data3$login

#Want to extract the current users followers and then extract who the current user follows
#then check if there is duplication or a connection between who the current user follows and their followers

#Get current users followers
#Get who current user follows
#Convert to database
#Check for duplication

#using a single for loop to gather data from a user ie. who the follow and who their followers follow.
#including number of repositories commits etc.

#Interrogate API to get FOLLOWERS

data <- GET("https://api.github.com/users/Finnegr1/following?per_page=100;", getToken1)
data
extract = content(data)
dataframe1 = jsonlite::fromJSON(jsonlite::toJSON(extract))
#create dataframe to place collected data 
id = dataframe1$login
id
users = c(id)

#main dataframe with data collected from interrogation of API 
#userDF = data.frame(Username=integer(), Followers = integer(), Repositories = integer())  

#create empty vectors to hold collected data
allusers = c()
#numberofrepos = c()
#totalfollowerslist = c()


#FOR loop to gather data from initial user, user hardcoded above 




for(i in 1:length(users)){
  currentusername = users[i]
  url = paste("https://api.github.com/users/", currentusername, "/followers",sep = "")
  followers = fromJSON(url)
  followerslogin = followers$login
  url2 = paste("https://api.github.com/users/", currentusername,sep = "")
  repos = fromJSON(url2)
  reposlist = repos$public_repos
}
totalusers = c(followerslogin, reposlist)

totalFollowers = write.csv(totalusers, 'data.csv')


#Interrogate Github
data <- fromJSON("https://api.github.com/users/sorchaobyrne/followers")

names(data)

#Find login names
id = data1$login

users = c(id)

#all users followers
users

#Create temporary vector 
totalusers = c()
totalusers2 = c()

#Interrogate Github to get FOLLOWERS into a CSV
for (i in 1:length(users))
{
  username = users[i]
  url = paste("https://api.github.com/users/" , username, "/followers", sep = "")
  followers = fromJSON(url)
  login = followers$login
  for (j in 1:length(followerslogin))
  {
    if (is.element(login[j], totalusers) == FALSE)
    {
      totalusers[[length(totalusers)+1]] = login[j]
    }
    next
  }
  next
}
totalusers

totalFollowers = write.csv(totalusers, 'Followers.csv')

#Interrogate Github to get FOLLOWING into a CSV

for (i in 1:length(users))
{
  username = users[i]
  url = paste("https://api.github.com/users/" , username, "/following", sep = "")
  following = fromJSON(url)
  followinglogin = following$login
  for (j in 1:length(followinglogin))
  {
    if (is.element(followinglogin[j], totalusers2) == FALSE)
    {
      totalusers2[[length(totalusers2)+1]] = followinglogin[j]
    }
    next
  }
  next
}

totalusers2

write.csv(totalusers2, 'Following.csv')



