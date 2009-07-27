# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wedding_session',
  :secret      => 'f2a74a436535b9c7f3728336e9d93cbf0594e98dcaeb1d61ffcf4d1ce728f69de37358a1fae76e4cafc2f03854e35f1074fa79771c241e1f7c71ff45fb28962c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
