require_relative '../config/environment'

# require 'artii'
require "tco"
require 'paint'
require 'catpix'
require 'tty-prompt'
require 'pry'
# require 'espeak'


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

    def get_division_teams(id)
      Team.all.collect {|team| team.name if team.division_id == id}.compact.flatten
    end

    def pick_teams
      prompt = TTY::Prompt.new
      playoff_teams = []
      playoff_teams << prompt.multi_select("Select Teams from Atlantic Division:", get_division_teams(1))
      playoff_teams << prompt.multi_select("Select Teams from Metropolitan Division:", get_division_teams(2))
      playoff_teams << prompt.multi_select("Select Teams from Pacific Divsion:", get_division_teams(3))
      playoff_teams << prompt.multi_select("Select Teams from Central Divsion:", get_division_teams(4))
      sorted_teams = []
      # pos = [1,16,8,9, 4,13,5,12, 2,15,7,10, 3,14,6,11]
      pos = [0,8,12,4, 5,13,9,1, 2,10,14,6, 7,15,11,3]

        for i in pos
          sorted_teams << playoff_teams.flatten[i]
        end
        #  binding.pry
        sorted_teams
    end

    def team_hash
      team_hash = {"participants"=>[]}
      for i in pick_teams.flatten
              team_hash["participants"] << {"name"=>Team.find_by(name: i).name}
      end
      team_hash
    end

# teams = [1,2,3,4, 5,6,7,8, 9,10,11,12, 13,14,15,16]
# def sort_teams
#   sorted_teams = []
#   pos = [1,16,8,9, 4,13,5,12, 2,15,7,10, 3,14,6,11]
#     for i in pos
#       sorted_teams << pick_teams.flatten[i-1]
#     end
#      binding.pry
#     sorted_teams
#   end

 

end
