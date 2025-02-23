source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

gem 'bundler', '2.4.19'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '7.0.5'

# To load the env variables from .env file
gem 'dotenv-rails', '2.8.1'

# Use mysql as the database for Active Record
gem 'mysql2', '0.5.6'

# Use activerecord-import for bulk upsert
gem 'activerecord-import'

# Use Puma as the app server
gem 'puma', '5.0'

# To handle the soft delete
gem 'paranoia', '2.6.1'

# Use Active Model has_secure_password
gem 'bcrypt', '3.1.18'

# used for json web token
gem 'jwt', '2.7.1'

# used for email service
gem 'sendgrid-ruby', '6.6.2', git: 'https://bitbucket.org/experience-com/sendgrid-ruby/src', branch: 'master'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
gem 'rack-cors', '2.0.1'

# Use to add custom error messages on model validations
gem 'custom_error_message'

# Authorization
gem 'cancancan', '3.5.0'

# Array Pagination
gem 'kaminari', '1.2.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.16.0', require: false

# Google authentication tool
# gem 'omniauth', '2.1.1'
# gem 'omniauth-google-oauth2', '1.1.1'
gem 'omniauth', '1.9.1'
gem 'omniauth-google-oauth2', '0.8.0'


# Microsoft Azure
gem 'omniauth-microsoft_graph', '~> 0.3.3'


# SOLR DB
gem 'rsolr', '2.5.0'

# Mongo DB SETUP
gem 'mongoid', '8.0.1'

# TO READ .XLSX FILE
gem 'roo'

# TO WRITE .XLSX FILE
gem 'axlsx', '~> 2.0', '>= 2.0.1'

# Redis
gem 'redis', '4.8.1'
gem 'redis-queue', '0.1.0'

# Swagger API documentation
gem 'swagger-blocks', '3.0.0'

# To communicate with external API's
gem 'rest-client', '2.1.0'

# # A Ruby wrapper for the OAuth 2.0
# gem 'oauth2', '1.4.4'

# ### For Twitter - Social conenction####
# gem 'oauth', '0.5.5'

# # A Ruby wrapper for the OAuth 2.0
gem 'oauth2', '2.0.9'

### For Twitter - Social conenction####
gem 'oauth', '1.1.0'


gem 'ffi', '1.16.3'

group :development, :test, :devtest, :preprod, :qa do
  # To stop the code execution and get a debugger console
  gem 'pry', '0.14.2'

  # Call 'byebug' in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Faker for mock data
  gem 'faker'
end

group :development do
  gem 'listen', '3.8.0'
  # Speeds up development by running application in the background.
  gem 'spring', '4.1.1'
  gem 'spring-watcher-listen', '2.1.0'

  # Gems for code optimization and best practice
  gem 'brakeman', '6.0.1'
  gem 'rails_best_practices', '1.23.2'
  gem 'rubocop', '1.56.3', require: false
  gem 'rubycritic', '4.8.1', require: false
  gem 'traceroute', '0.8.1'
end

group :development, :test do
  # Testing framework to ROR
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0.0'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'mock_redis'
  gem 'rails-controller-testing'
  gem 'redis-namespace'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Build JSON APIs with ease
# gem 'jbuilder', '2.10.0'

# Newrelic APM monitoring agent
# gem 'newrelic_rpm', '~> 3.15', '>= 3.15.2.317'
gem 'newrelic_rpm', '9.13'

# Rack middleware for blocking & throttling abusive requests
gem 'rack-attack', '6.7.0'

# It's a full-featured background processing
gem 'delayed', '0.5.0'

# Daemons provides exception backtracing, logging, monitoring & automatic restarting
gem 'daemons', '1.4.1'

# Simple, efficient background processing
gem 'sidekiq', '6.5.9'

# Generic connection pool for Ruby
gem 'connection_pool', '2.4.1'

# To connect Facebook API
gem 'koala', '3.5.0'

# Generate private/public SSH keypairs
gem 'net-ssh', '~> 7.2'
gem 'sshkey', '~> 3.0'

# The public-key signature system described in RFC 8032.
gem 'ed25519', '1.3.0'

# bcrypt_pbkdf is a ruby gem implementing bcrypt_pbkdf
gem 'bcrypt_pbkdf', '1.1.0'

# Tool to connect twilio Api
gem 'twilio-ruby'

# HTTP/REST API client library
gem 'faraday'

# Psych is a YAML parser and emitter
gem 'psych', '5.1.0'

# A gem calculate difference between two given time
gem 'time_difference', '0.5.0'

# Audit the DB transactions
gem 'audited', '5.3.2'

# Writing and Deploying cron jobs
gem 'whenever', '1.0.0', require: false

# To support multi column primary key #
gem 'composite_primary_keys', '14.0.6'

# Used for pdf generation
gem 'prawn', '2.4.0'
gem 'prawn-table', '0.2.2'

# Ruby Mail handler
gem 'mail', '2.7.1'

gem 'image_processing', '~> 1.12', '>= 1.12.2'
gem 'image_optim', '~> 0.31.2'

# for obtaining the street or IP address or coordinates to street address
gem 'geocoder', '1.8.2'

# Facebook sso login
gem 'omniauth-facebook', '~> 8.0'

gem 'elasticsearch', '~> 8.6'

gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

gem "webrick", "~> 1.8"

gem "matrix", "~> 0.4.2"

gem "sprockets-rails"

gem 'delivery_boy'

gem 'omniauth-okta'

gem 'nokogiri'

gem 'slack-notifier', '~> 2.4'

gem 'twitter'

gem 'google-apis-webmasters_v3'


gem 'timezone_finder', '1.5.7'

gem 'tzinfo', '2.0.6'
## GCP related gems
gem 'functions_framework', '1.0'
gem 'google-cloud-storage', '1.49'
gem 'google-cloud-pubsub', '2.18'
gem 'addressable', '2.8'
gem 'google-cloud-functions', '1.5'
gem 'google-cloud-secret_manager', '1.4'

# To validate phone number countrywise
gem 'phonelib', '~> 0.9.1'

# Sentry
gem 'stackprof'
gem 'sentry-ruby', '5.19'
gem 'sentry-rails', '5.19'
gem 'sentry-sidekiq', '5.19'

gem 'browser', '5.3.1'
gem 'concurrent-ruby', '1.3.4'
