require 'bundler'

require 'challonge-api'
require 'pry'
require 'launchy'
require 'securerandom'
require 'rest-client'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
