
require 'artii'
require "tco"
require 'paint'
require 'catpix'
require 'tty-prompt'
require 'pry'

# Catpix::print_image "/Users/pasbynumbers/Downloads/shutterstock_1017189022.jpg",
#   :limit_x => 1.0,
#   :limit_y => 0,
#   :center_x => true,
#   :center_y => true,
#   :bg => "white",
#   :bg_fill => true,
#   :resolution => "high"

# puts "Welcome to the"
# a = Artii::Base.new :font => 'slant'
# puts Paint[a.asciify('Stanley Cup Simulation!'), :blue, :bright, :bold, :black]

# puts Paint['Ruby', :red]

# prompt = TTY::Prompt.new

# binding.pry

# choices = ["team 1", "team 2", "team 3", "team 4", "team 5"]
# prompt.multi_select("Select Teams:", choices)

class CommandLineInterface

    def greet
        a = Artii::Base.new :font => 'slant'
        puts Paint[a.asciify('Stanley Cup Simulation!'), :blue, :bright, :bold, :black]
    end

    def stanley
    Catpix::print_image "/Users/pasbynumbers/Downloads/stanley-cup-jay-fhjay-fh-stanley-cup-clip-art-469_1000.jpg",
  :limit_x => 1.0,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => true,
  :resolution => "medium"
    end

end

cli = CommandLineInterface.new

cli.stanley
cli.greet