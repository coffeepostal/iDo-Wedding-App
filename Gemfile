source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'sqlite3'
gem 'kaminari'
gem 'haml-rails'

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.0'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rcov'
  gem 'webrat'
  gem 'capybara'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork'

  gem 'growl',  '~> 1.0.3' # Install Growl (http://growl.info) then `brew install growlnotify`

  if RUBY_PLATFORM =~ /darwin/i
    gem 'rb-fsevent', '0.4.3'
  end
end
