# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_kanban_session',
  :secret => 'cbcb1b197e1c19491039e4dc7434d1795ce391c51ddf70073e62113743912b6e88bc3d182fc2f347a54a9a3e42e470d0e86ca0c3ce7b53315129dbcb0995c066'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
