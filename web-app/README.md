# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
docker-compose run web-app bundle install
docker-compose up --build -V

* ...

docker-compose run web-app bundle install
docker-compose run web-app rails webpacker:install

docker-compose exec web-app rails g controller welcome

docker-compose up --build -V
docker-compose exec web-app tail -f /web-app/log/production.log

docker-compose exec web-app rails credentials:edit