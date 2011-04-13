# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_GameNight.pl_session',
  :secret      => 'c050a3d8a6912753bbfeca963ecd633751b60af872e53984f6b82a912fc1261bf8d11941b954e564c536aa30f0d95612dd0ab4776ae1d9a5e3151c991489432c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
