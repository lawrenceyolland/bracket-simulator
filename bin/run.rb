require_relative '../config/environment'
require_relative 'cli.rb'



puts "HELLO WORLD"

cli = CommandLineInterface.new

# require 'espeak'

# def speech1
# speech1 = ESpeak::Speech.new("welcome")
# speech1.speak 
# end
# def speech2
# speech2 = ESpeak::Speech.new("to the stanley cup simulator 6000. welcome to realistic graphic, future sport experience")
# speech2.speak 
# end

#   speech1
#   speech2
# cli.stanley
cli.greet
cli.pick_teams
# cli.sort_teams
