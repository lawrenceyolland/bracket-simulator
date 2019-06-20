require 'bundler'
Bundler.require

require 'challonge-api'
require 'pry'
require 'launchy'
require 'securerandom'
require 'rest-client'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger=nil

# ~~~~~~ Running App ~~~~~~~~ #
require_all 'app'
require_all 'bin'
require_all 'lib'

# ~~~~~~ Migrations ~~~~~~~~~ #
# require_all 'db/migrate'




