# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_edot_session',
  :secret      => '6226e78eb1ba91b3085f6c9b422f229928e36a3ddce586f32a199f9ba28d8552a1bac5cdd6e20800651ef78469590f7e35bd241aa1e26189111f9bc72d73662f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
