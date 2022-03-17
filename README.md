# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
    * rails generate migration UserTestsTable*

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Heroku
##  View logs 
* heroku login
* heroku logs
* heroku run db:migrate
* RAILS_ENV=production bundle exec rake assets:precompile
* RAILS_ENV=production bundle exec rake assets:precompile  

## migrattion

# webpack
* heroku buildpacks
* rake assets:precompile RAILS_ENV=production
* RAILS_ENV=production bundle exec rake assets:precompile
* bundle exec bin/webpack-dev-server
* rake assets:precompile

* heroku buildpacks:set heroku/nodejs

# reset last commit
* git reset HEAD~    

# FIX BUG DEPLOY
Rather than deleting the whole Gemfile.lock file, you can just delete the BUNDLED WITH section of that file;

BUNDLED WITH
1.17.1
Another reasonable fix (if you're able to) is to update rubygems (as hinted by the linked blogpost above);

gem update --system

gem install bundler --user-install