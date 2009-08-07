ENV['RAILS_ENV'] = 'development'
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

SERVER = :local

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'Pacific Time (US & Canada)'

  # config.action_controller.session = {
  #   :session_key => '_dev.legrandcru.us_session',
  #   :secret      => 'be9909de924ded89f3f1d20944186b6972542c33023868b60f28a2393ff5fa48fd89923387637a7f8921834bdb7366fc3e1f7a88f91054ed96903a1cc567600c'
  # }

  # config.action_controller.session_store = :active_record_store
end

# PAYPAL_CERT_PEM = File.read(Rails.root.join('certs', Rails.env, 'paypal_cert.pem'))
# APP_CERT_PEM    = File.read(Rails.root.join('certs', Rails.env, 'app_cert.pem'))
# APP_KEY_PEM     = File.read(Rails.root.join('certs', Rails.env, 'app_key.pem'))

# INPUTS_WITH_CLASS_PREFIX = 'type-'

# Paperclip.options[:command_path] = '/opt/local/bin/'



# # Be sure to restart your server when you modify this file
# 
# ENV['RAILS_ENV'] ||= 'development'
# 
# # Specifies gem version of Rails to use when vendor/rails is not present
# RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION
# 
# # Bootstrap the Rails environment, frameworks, and default configuration
# require File.join(File.dirname(__FILE__), 'boot')
# 
# Rails::Initializer.run do |config|
#   # Settings in config/environments/* take precedence over those specified here.
#   # Application configuration should go into files in config/initializers
#   # -- all .rb files in that directory are automatically loaded.
# 
#   # Add additional load paths for your own custom dirs
#   # config.load_paths += %W( #{RAILS_ROOT}/extras )
# 
#   # Specify gems that this application depends on and have them installed with rake gems:install
#   # config.gem "bj"
#   # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
#   # config.gem "sqlite3-ruby", :lib => "sqlite3"
#   # config.gem "aws-s3", :lib => "aws/s3"
# 
#   # Only load the plugins named here, in the order given (default is alphabetical).
#   # :all can be used as a placeholder for all plugins not explicitly named
#   # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
# 
#   # Skip frameworks you're not going to use. To use Rails without a database,
#   # you must remove the Active Record framework.
#   # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
# 
#   # Activate observers that should always be running
#   # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
# 
#   # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
#   # Run "rake -D time" for a list of tasks for finding time zone names.
#   config.time_zone = 'Pacific Time (US & Canada)'
# 
#   # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
#   # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
#   # config.i18n.default_locale = :de
# end
