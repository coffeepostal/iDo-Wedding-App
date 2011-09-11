source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'sqlite3'
gem 'kaminari'
gem 'haml-rails'
gem 'simple_form'

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.0'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier'
end

gem 'jquery-rails'

group :development do
  gem 'rails3-generators' # for factory_girl_rails and simple_form
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rcov'
  gem 'shoulda-matchers'
  gem 'webrat'

  gem 'guard-bundler'
  gem 'guard-migrate'
  gem 'guard-rspec'
  gem 'guard-spork'

  gem 'growl' # Install Growl (http://growl.info) then `brew install growlnotify`

  if RUBY_PLATFORM =~ /darwin/i
    gem 'rb-fsevent', '0.4.3'
  end
end
