source 'https://rubygems.org'

gem 'rails', '3.2.17'
gem 'pry-rails', :group => [:development, :test]

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'dotenv-rails', :groups => [:development, :test]

# Gems used only for assets and not required
# in production environments by default.
# group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  
  gem 'haml-rails'
# end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'nokogiri'

# gem 'sunspot_rails'
# gem 'sunspot_solr'


group :development, :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'  # emulates live integration tests, need to have firefox web browser installed
  # gem 'capybara-webkit'
  gem 'launchy'       # allows you to save test page from selenium-webdriver
  gem 'rack-mini-profiler'
  gem "lol_dba"  # rake db:find_indexes
  gem 'consistency_fail'
end

