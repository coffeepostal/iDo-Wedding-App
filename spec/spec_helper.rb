require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'forgery'
  require 'rspec/rails'
  require 'capybara/rspec'

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include Factory::Syntax::Methods

    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    config.use_transactional_fixtures = true
  end

  # alias Forgery as F to keep things short
  F = Forgery
end

Spork.each_run do
  # This code will be run each time you run your specs.
  DatabaseCleaner.clean
  FactoryGirl.factories.clear
  Dir[Rails.root.join('spec/factories/**/*.rb')].each{|file| load file}
  Rails.application.reload_routes!
end
