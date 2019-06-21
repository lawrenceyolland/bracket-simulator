
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

  def load_icon
    spinner = TTY::Spinner.new("[:spinner] Loading...", format: :bouncing_ball)
    spinner.auto_spin
    sleep(3)
    spinner.stop('Receiving data')
  end


  # def all_logo(team_name)
  #   logo = team_name.downcase.split(" ").join("_")
  #   Catpix::print_image "assets/logos/#{logo}.gif",
  #   :limit_x => 0.7,
  #   :limit_y => 0.7,
  #   :center_x => true,
  #   :center_y => true,
  #   :resolution => "high"
  # end

  # def pick_team

  # end

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
      menu.choice "2019 Bracket", 1
      menu.choice "Create your own", 2
    end

  system 'clear'
  
  if input == 1

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
        
        array_of_teams = team_hash["participants"].collect { |t| t["name"]}
        prompt = TTY::Prompt.new
        player_team = prompt.select("Pick your team:", array_of_teams, per_page: 16)
        self.load_icon
      
        return player_team, team_hash
    end

  elsif input == 2

    # def pick_teams
    #   playoff_teams = []
    #   atlantic_pick_teams(playoff_teams)
    #   metropolitan_pick_teams(playoff_teams)
    #   pacific_pick_teams(playoff_teams)
    #   central_pick_teams(playoff_teams)
    #   system 'clear'
    #   playoff_teams
    # end

    def pick_teams
      playoff_teams = []
      x_pick_team(playoff_teams, "Atlantic Division", 1)
      x_pick_team(playoff_teams, "Metropolitan Division", 2)
      x_pick_team(playoff_teams, "Pacific Division", 3)
      x_pick_team(playoff_teams, "Central Division", 4)
      system 'clear'
      playoff_teams
    end

    def x_pick_team(playoff_teams,division_name, data_source)
      prompt = TTY::Prompt.new
      team_array = []
      team_array << prompt.multi_select("Select 4 Teams from #{division_name}:", get_division_teams(data_source), max:4, per_page: 10)
      if team_array.flatten.count != 4
        team_array.clear
        system 'clear'
        puts "You didn't select FOUR. Try again..."
        x_pick_team(playoff_teams, division_name, data_source)
      else
        playoff_teams << team_array
      end
    end
    
    # def pick_teams
    #   prompt = TTY::Prompt.new
    #   playoff_teams = []
    #   playoff_teams << prompt.multi_select("Select 4 Teams from Atlantic Division:", get_division_teams(1), max:4, per_page: 10)
    #   playoff_teams << prompt.multi_select("Select 4 Teams from Metropolitan Division:", get_division_teams(2), max:4, per_page: 10)
    #   playoff_teams << prompt.multi_select("Select 4 Teams from Pacific Divsion:", get_division_teams(3), max:4, per_page: 10)
    #   playoff_teams << prompt.multi_select("Select 4 Teams from Central Divsion:", get_division_teams(4), max:4, per_page: 10)
    #   playoff_teams 
    # end
 
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

      array_of_teams = team_hash["participants"].collect { |t| t["name"]}
      prompt = TTY::Prompt.new
      player_team = prompt.select("Pick your team:", array_of_teams, per_page: 16)

      self.load_icon
      return player_team, team_hash
    end
  end

  # def player_team
  #   prompt = TTY::Prompt.new
  #   player_team = prompt.multi_select("Select your team:", team_hash)
  #   player_team
  # end

cli.stanley
cli.greet