
# Catpix::print_image "/Users/pasbynumbers/Downloads/shutterstock_1017189022.jpg",
#   :limit_x => 1.0,
#   :limit_y => 0,
#   :center_x => true,
#   :center_y => true,
#   :bg => "white",
#   :bg_fill => true,
#   :resolution => "high"


a = Artii::Base.new :font => 'slant'
puts Paint[a.asciify('Stanley Cup Simulator!'), :blue, :bright, :bold, :black]

# puts Paint['Ruby', :red]

# prompt = TTY::Prompt.new


class CommandLineInterface

    # def greet
    #     a = Artii::Base.new :font => 'slant'
    #     puts Paint[a.asciify('Stanley Cup Simulator!'), :blue, :bright, :bold, :black]
    # end

  #   def stanley
  #   Catpix::print_image "/Users/pasbynumbers/Downloads/stanley-cup-jay-fhjay-fh-stanley-cup-clip-art-469_1000.jpg",
  # :limit_x => 1.0,
  # :limit_y => 0,
  # :center_x => true,
  # :center_y => true,
  # :bg => "white",
  # :bg_fill => true,
  # :resolution => "medium"
  #   end

  def get_division_teams(id)
    Team.all.collect {|team| team.name if team.division_id == id}.compact.flatten
  end


  # puts "Would you like to use the 2019 playoff bracket? (y/n)"
  # input = gets.chomp
    prompt1 = TTY::Prompt.new
    input = prompt1.select("Would you like to use the 2019 bracket or create your own?") do |menu|
    menu.choice "2019 Bracket", 'y'
    menu.choice "Create your own", 'n'
    end
  if input == 'y'
    def team_hash
      
    team_hash = {"participants"=> [
        {"name"=>"Tampa Bay Lightning"},
        {"name"=>"Nashville Predators"},
        {"name"=>"Calgary Flames"},
        {"name"=>"Washington Capitals"},
        {"name"=>"New York Islanders"},
        {"name"=>"San Jose Sharks"},
        {"name"=>"Winnipeg Jets"},
        {"name"=>"Boston Bruins"},
        {"name"=>"Toronto Maple Leafs"},
        {"name"=>"St Louis Blues"},
        {"name"=>"Las Vegas Golden Knights"},
        {"name"=>"Pittsburgh Penguins"},
        {"name"=>"Carolina Hurricanes"},
        {"name"=>"Colorado Avalanche"},
        {"name"=>"Dallas Stars"},
        {"name"=>"Columbus Blue Jackets"}]}
        team_hash
    end
  elsif input == 'n'
 
    def pick_teams
      prompt = TTY::Prompt.new

      playoff_teams = []
      playoff_teams << prompt.multi_select("Select 4 Teams from Atlantic Division:", get_division_teams(1), max:4, per_page: 10)
      playoff_teams << prompt.multi_select("Select 4 Teams from Metropolitan Division:", get_division_teams(2), max:4, per_page: 10)
      playoff_teams << prompt.multi_select("Select 4 Teams from Pacific Divsion:", get_division_teams(3), max:4, per_page: 10)
      playoff_teams << prompt.multi_select("Select 4 Teams from Central Divsion:", get_division_teams(4), max:4, per_page: 10)
      playoff_teams
      
      end
    
    def sort_teams
      sorted_teams = []
      unsorted_teams = pick_teams
      pos = [0,8,12,4, 5,13,9,1, 2,10,14,6, 7,15,11,3]
        for i in pos
          sorted_teams << unsorted_teams.flatten[i]
        end
        sorted_teams
    end
      def team_hash
      team_hash = {"participants"=>[]}
      for i in sort_teams.flatten
              team_hash["participants"] << {"name"=>Team.find_by(name: i).name}
      end
      team_hash
    end
  end
#   def player_team
#     prompt = TTY::Prompt.new
#     player_team = prompt.multi_select("Select your team:", team_hash)
#     player_team
# end

end
