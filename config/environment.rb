
require 'bundler'
Bundler.require

require 'challonge-api'
require 'pry'
require 'launchy'
require 'securerandom'
require 'rest-client'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger=nil
# require_all 'lib'
require_all 'app'
# require_all 'bin'
# require_all 'config'
# require_relative "../lib/sim_series.rb"

require_relative '../bin/cli.rb'
require_relative '../config/access.rb'
require_relative '../lib/sim_series.rb'
require_relative '../lib/bracket_maker.rb'
# binding.pry
# 