require 'bundler'
Bundler.require

require 'challonge-api'
require 'pry'
require 'launchy'
require 'securerandom'
require 'rest-client'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

# ~~~~~~ Running App ~~~~~~~~ #
require_all 'config'
require_all 'app'

require_relative 'lib/cli.rb'
require_relative 'lib/round_class.rb'
require_relative 'lib/assign_results.rb'
require_relative 'lib/bracket_maker.rb'
require_relative 'lib/game_modes.rb'

require_all 'lib'






# ~~~~~~ Migrations ~~~~~~~~~ #
# require_all 'db/migrate'




