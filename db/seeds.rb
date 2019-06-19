require_relative "../app/models/conferences.rb"
require_relative "../app/models/divisions.rb"
require_relative "../app/models/teams.rb"
require_relative "../app/models/players.rb"
require_relative "../lib/players.rb"

# Set up conferences
eastern = Conference.create(name: "Eastern Conference")
western = Conference.create(name: "Western Conference")

# Set up divisions
# Eastern conference
atlantic = Division.create(name: "Atlantic Division", conference_id: 1)
metropolitan = Division.create(name: "Metropolitan Division", conference_id: 1)

# Western conference
pacific = Division.create(name: "Pacific Division", conference_id: 2)
central = Division.create(name: "Central Division", conference_id: 2)

# Set up teams
# Atlantic Division
tampa_bay_lightning = Team.create(name: "Tampa Bay Lightning", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/lightning.jpeg", division_id: 1)
boston_bruins = Team.create(name: "Boston Bruins", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/bruins.jpeg", division_id: 1)
toronto_maple_leafs = Team.create(name: "Toronto Maple Leafs", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/leafs.jpeg", division_id: 1)
montreal_canadiens = Team.create(name: "Montreal Canadiens", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/canadiens.jpeg", division_id: 1)
florida_panthers = Team.create(name: "Florida Panthers", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/panthers.jpeg", division_id: 1)
buffalo_sabres = Team.create(name: "Buffalo Sabres", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/sabres.jpeg", division_id: 1)
detroit_redwings = Team.create(name: "Detroit Redwings", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/redwings.jpeg", division_id: 1)
ottawa_senators = Team.create(name: "Ottawa Senators", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/sens.jpeg", division_id: 1)

# Metropolitan Division
washington_capitals = Team.create(name: "Washington Capitals", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/caps.jpeg", division_id: 2)
new_york_islanders = Team.create(name: "New York Islanders", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/islanders.jpeg", division_id: 2)
pittsburgh_penguins= Team.create(name: "Pittsburgh Penguins", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/pens.jpeg", division_id: 2)
carolina_hurricanes = Team.create(name: "Carolina Hurricanes", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/canes.jpeg", division_id: 2)
columbus_blue_jackets = Team.create(name: "Columbus Blue Jackets", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/bluejackets.jpeg", division_id: 2)
philadelphia_flyers = Team.create(name: "Philadelphia Flyers", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/flyers.jpeg", division_id: 2)
new_york_rangers = Team.create(name: "New York Rangers", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/rangers.jpeg", division_id: 2)
new_jersey_devils = Team.create(name: "New Jersey Devils", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/devils.jpeg", division_id: 2)

# Pacific Division
calgary_flames = Team.create(name: "Calgary Flames", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/flames.jpeg", division_id: 3)
san_jose_sharks = Team.create(name: "San Jose Sharks", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/sharks.jpeg", division_id: 3)
las_vegas_golden_knights = Team.create(name: "Las Vegas Golden Knights", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/goldenknights.jpeg", division_id: 3)
arizona_coyotes = Team.create(name: "Arizona Coyotes", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/coyotes.jpeg", division_id: 3)
vancouver_canucks = Team.create(name: "Vancouver Canucks", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/canucks.jpeg", division_id: 3)
anaheim_ducks = Team.create(name: "Anaheim Ducks", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/ducks.jpeg", division_id: 3)
edmonton_oilers = Team.create(name: "Edmonton Oilers", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/oilers.jpeg", division_id: 3)
los_angeles_kings = Team.create(name: "Los Angeles Kings", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/kings.jpeg", division_id: 3)

# Central Division
nashville_predators = Team.create(name: "Nashville Predators", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/preds.jpeg", division_id: 4)
winnipeg_jets = Team.create(name: "Winnipeg Jets", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/jets.jpeg", division_id: 4)
st_louis_blues = Team.create(name: "St Louis Blues", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/blues.jpeg", division_id: 4)
dallas_stars = Team.create(name: "Dallas Stars", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/stars.jpeg", division_id: 4)
colorado_avalanche = Team.create(name: "Colorado Avalanche", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/avs.jpeg", division_id: 4)
chicago_blackhawks = Team.create(name: "Chicago Blackhawks", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/blackhawks.jpeg", division_id: 4)
minnesota_wild = Team.create(name: "Minnesota Wild", wins: 0, losses: 0, games_played: 0, championship_wins: 0, img_path: "lib/assets/logos/wild.jpeg", division_id: 4)

default_team = Team.create()

player_array.each_with_index do |team,index|
    team.each do |name|
        Player.create(name: name, series_goals: 0, total_goals: 0, goals_per_game: 0, team_id: index+1)
    end  
end  