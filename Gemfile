source 'https://rubygems.org'

gem 'rails', '~> 4.2.5.1'

gem 'devise', '~> 3.5.5'
# gem 'grape-active_model_serializers'
gem 'jbuilder', '~> 2.4'
gem 'jquery-rails', '~> 4.1.0'
gem 'pg', '~> 0.18.4'
gem 'paperclip', '~> 4.3'
gem 'responders', '~> 2.1'
gem 'searchkick', '~> 1.1.2'
gem 'sqlite3'
gem 'turbolinks'

# API related gems
gem 'grape', '~> 0.14.0'
gem 'grape-swagger', '~> 0.10.4' # Adds swagger documentation to grape
gem 'grape-swagger-rails', '~> 0.1.0' # Add swagger-ui assests to asset pipeline
gem 'rack-cors', :require => 'rack/cors' # Make Swagger spec CORS, required!
gem 'kramdown', '~> 1.9.0'

# Authentication
gem 'doorkeeper', '~> 3.1.0' # An Oauth 2 provider for Rails and Grape
# gem 'wine_bouncer', '~> 0.5.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# Turbolinks makes following links in your web application faster. Read more:
# https://github.com/rails/turbolinks
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'simplecrud', github: 'dsaenztagarro/simplecrud', branch: 'master'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rvm', '0.1.2'
  gem 'capistrano-rails', '~> 1.1.6'
  gem 'capistrano-passenger', '0.2.0'

  gem 'rb-fchange', require: false # Windows
  gem 'rb-fsevent', require: false # OS X
  gem 'rb-inotify', require: false # Linux
  gem 'terminal-notifier-guard'

  gem 'guard', '2.13.0'
  gem 'guard-bundler', '2.1.0'
  gem 'guard-cucumber', '~> 2.0.0'
  gem 'guard-rspec', '4.6.4'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0.0'

  # Authorization client
  gem 'oauth2'
end

group :test do
  gem 'capybara', '~> 2.6.0'
  gem 'coveralls', '~> 0.8.10'
  gem 'cucumber-rails', '1.4.3', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails', '4.5.0'
  gem 'rspec-rails', '3.4.0'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'simplecov', '~> 0.11.2'
  gem 'simplecov-console', '~> 0.3.0'
end

group :test, :development do
  gem 'byebug'
  gem 'cane'
  gem 'pry-byebug'
  gem 'reek'
  gem 'rubocop'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.6.1'
  gem 'spring-commands-rspec', '~> 1.0.4'
end
