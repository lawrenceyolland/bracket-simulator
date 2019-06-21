a = Artii::Base.new :font => 'slant'
puts Paint[a.asciify('Stanley Cup Simulator!'), :blue, :bright, :bold]

class CommandLineInterface

  pid = fork{ exec 'afplay', 'lib/assets/o_canada_8bit.mp3' } 

  def load_icon
    spinner = TTY::Spinner.new("[:spinner] Loading...", format: :bouncing_ball)
    spinner.auto_spin
    sleep(3)
    spinner.stop('Receiving data')
  end

  def get_division_teams(id)
    Team.all.collect {|team| team.name if team.division_id == id}.compact.flatten
  end

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
    prompt = TTY::Prompt.new
    answer = prompt.select("Would you like to create a team?") do |menu|
      menu.choice "Yes", 1
      menu.choice "No", 2
    end

    if answer == 1

    p1 = Player.all.find_by_id(156)
    p2 = Player.all.find_by_id(157)
    p3 = Player.all.find_by_id(158)
    p4 = Player.all.find_by_id(159)
    p5 = Player.all.find_by_id(160)

    team_name = prompt.ask('What would you like to call your team?', required: true)
      name1 = prompt.ask('Enter the name of your first player', default: 'Grayne Wetzky')
      name2 = prompt.ask('Enter the name of your second player', default: 'Doug "The Thug" Glatt')
      name3 = prompt.ask('Enter the name of your third player', default: 'Bob McKenzie')
      name4 = prompt.ask('Enter the name of your fourth player', default: 'Happy Gilmore')
      name5 = prompt.ask('Enter the name of your fifth player', default: 'Gordon Bombay')
    
      division_id = prompt.select('Which division will your team play in?') do |menu|
        menu.choice "Atlantic Division", 1
        menu.choice "Metropolitan Division", 2
        menu.choice "Pacific Division", 3
        menu.choice "Central Division", 4
      end

      default_team = Team.find_by_id(32)

      # Update database
      default_team.update(:name => team_name, :games_played => 0, :championship_wins => 0, :division_id => division_id)
      p1.update(:name => name1, :series_goals => 0, :total_goals => 0, :goals_per_game => 0)
      p2.update(:name => name2, :series_goals => 0, :total_goals => 0, :goals_per_game => 0)
      p3.update(:name => name3, :series_goals => 0, :total_goals => 0, :goals_per_game => 0)
      p4.update(:name => name4, :series_goals => 0, :total_goals => 0, :goals_per_game => 0)
      p5.update(:name => name5, :series_goals => 0, :total_goals => 0, :goals_per_game => 0)

    elsif answer == 2
      
    end

    def pick_teams
      playoff_teams = []
      x_pick_team(playoff_teams, "Atlantic Division", 1)
      x_pick_team(playoff_teams, "Metropolitan Division", 2)
      x_pick_team(playoff_teams, "Pacific Division", 3)
      x_pick_team(playoff_teams, "Central Division", 4)
      system 'clear'
      playoff_teams
    end

    def x_pick_team(playoff_teams, division_name, data_source)
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

end
# cli.stanley
# cli.greet



