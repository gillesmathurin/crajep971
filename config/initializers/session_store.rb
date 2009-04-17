# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crajep_session',
  :secret      => '6804e3fa0fe155a1690b60065d5ae9ea4f366f025d7d5f9390d05128cca8fd94b09029502926a7a66728fed8fc27681e505d0d78b7eaf9854466180cbe494f81'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
