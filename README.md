# Github_Access -> Software Engineering - CS3012
Github Visualisation - Emma Bourke (Student ID: 15320411)

Aim: Interrogate the GitHub API to retrieve and display data regarding the logged in developer

All code was produced in R, and then used in Plotly to produce interactive graphs. To see the interactive graphs please visit my Plotly account page at:

                              https://plot.ly/~bourkee3

The data used to create these charts is in my repository as Data.csv. Below is a brief description of how I gathered this data:

Data collected from the interrogation of the API.
The writing of the code required installation of the following packages: plotly, jsonlite, dplyr, httpuv, httr.

Starting with the user "khotyn"
First I collected all of the Github accounts who "khotyn" follows
I created a nested for loop to loop through the vector and collected each user in the vectors following
I then looped through this vector of users to gather certain relevant information such as number of followers, following, repos, date account was created and last updated.


