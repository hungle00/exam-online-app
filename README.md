# EXAM ONLINE APP

## Dependencies

* Devise - For implementing authentication

* FriendlyId - For create human-friendly url

* Charkick - For draw chart

## General functionality
* Authenticate users (login/signup pages + logout)
* Oauth with Github/ Twitter  
* Edit account / upload avatar
* Take Exam 
* Report if exam have problems
* Receive notifications
* View top submissions

` - Admin User `

* CRUD Categories
* CRUD Exams
* View dashboard
* Export users, submissions list to CSV


## Installation

*After clone and install ruby and js library, run:*

```
rails db:migrate
rails db:seed
rails s
```   

*For send email and oauth with twitter/github features, create secrets.yml in config and insert:*

```
development:
  mail_username: 
  mail_password:
  github_client_id: 
  github_client_secret: 
  twitter_client_id: 
  twitter_client_secret: 
```

