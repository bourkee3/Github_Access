?gh

token = .token = '052137bff6862d5258992535b50dd0de1ab716e0'

gh("/users/bourkee3/repos")
gh("/users/:username/repos", username = "bourkee3", .token = token)

users <- gh("/users", .limit = 50)
length(users)
users

j_repos <- gh("/users/:username/repos", username = "ecclesg")
vapply(j_repos, "[[", "", "name")
j_repos

