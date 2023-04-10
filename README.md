# koombea-ecommerce
Ecommerce schetch as a tecnical test for Koombea company

DEPENDENCIES

ruby 2.7.8
rails 7.0.4
ElasticSearch 5.6.16 (I already had this legacy version installed on my machine, because this was used, legacy, but compatible gem 'searchkick 1.5.1' and 'elasticsearch 5.0.5').
Postgresql 10
Redis 6.0.5

Comands to run project
  Config database credentials (user and password) on database.yml file
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
  rails s to start server

  Access app enviroment on http://localhost:3000
    Necessary create a new account
  Access admin enviroment on http://localhost:3000/admin
    email: 'admin@example.com'
    password: 'password'

Tests
  Imported and configured gem rspec but one error runned on local machine with Ubuntu 18.04 on run comand "rspec spec":
  "rbenv: version `2.7.8' is not installed (set by /home/vinicius/projects/koombea-ecommerce/.ruby-version)".
  Due this did not was implemented more automatic tests.
