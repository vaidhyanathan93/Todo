# README

This is the Todo Application API using ROR. The sample API coverage is below.

# Docker usage

# First time setup
- Download/clone the repo
- cd Todo
- docker-compose build
- docker-compose up -d
- docker-compose run app rake db:migrate #for table creation

Starting and stopping app
- docker-compose start
- docker-compose stop


# Native usage 
- Ruby version

  2.6.0

- System dependencies

Ruby - 2.6.0, Mysql

To install Ruby use rvm to switch between mutliple version

- Database creation

rake db:migrate

- Deployment instructions

git clone URL
cd TodoMVC
bundle install
rails s

# API Usage & guidelines

https://documenter.getpostman.com/view/2726374/S1Zw7qf7?version=latest
