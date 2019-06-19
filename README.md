# README

This is the Todo Application API using ROR. The sample API coverage is below.

- Docker usage

First time setup
docker-compose build
docker-compose up -d
docker-compose run app rake db:create #run this in a seperate console for db migration

Starting and stopping
docker-compose start
docker-compose stop

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

\*API Usage

https://documenter.getpostman.com/view/2726374/S1Zw7qf7?version=latest
