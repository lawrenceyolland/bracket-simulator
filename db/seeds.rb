require_relative "../app/models/conferences.rb"
require_relative "../app/models/divisions.rb"
require_relative "../app/models/teams.rb"
require_relative "../app/models/players.rb"

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
tampa_bay_lightning = Team.create(name: "Tampa Bay Lightning", division_id: 1)
boston_bruins = Team.create(name: "Boston Bruins", division_id: 1)
toronto_maple_leafs = Team.create(name: "Toronto Maple Leafs", division_id: 1)
montreal_canadiens = Team.create(name: "Montreal Canadiens", division_id: 1)
florida_panthers = Team.create(name: "Florida Panthers", division_id: 1)
buffalo_sabres = Team.create(name: "Buffalo Sabres", division_id: 1)
detroit_redwings = Team.create(name: "Detroit Redwings", division_id: 1)
ottawa_senators = Team.create(name: "Ottawa Senators", division_id: 1)

# Metropolitan Division
washington_capitals = Team.create(name: "Washington Capitals", division_id: 2)
new_york_islanders = Team.create(name: "New York Islanders", division_id: 2)
pittsburgh_penguins= Team.create(name: "Pittsburgh Penguins", division_id: 2)
carolina_hurricanes = Team.create(name: "Carolina Hurricanes", division_id: 2)
columbus_blue_jackets = Team.create(name: "Columbus Blue Jackets", division_id: 2)
philadelphia_flyers = Team.create(name: "Philadelphia Flyers", division_id: 2)
new_york_rangers = Team.create(name: "New York Rangers", division_id: 2)
new_jersey_devils = Team.create(name: "New Jersey Devils", division_id: 2)

# Pacific Division
calgary_flames = Team.create(name: "Calgary Flames", division_id: 3)
san_jose_sharks = Team.create(name: "San Jose Sharks", division_id: 3)
las_vegas_golden_knights = Team.create(name: "Las Vegas Golden Knights", division_id: 3)
arizona_coyotes = Team.create(name: "Arizona Coyotes", division_id: 3)
vancouver_canucks = Team.create(name: "Vancouver Canucks", division_id: 3)
anaheim_ducks = Team.create(name: "Anaheim Ducks", division_id: 3)
edmonton_oilers = Team.create(name: "Edmonton Oilers", division_id: 3)
los_angeles_kings = Team.create(name: "Los Angeles Kings", division_id: 3)

# Central Division
nashville_predators = Team.create(name: "Nashville Predators", division_id: 4)
winnipeg_jets = Team.create(name: "Winnipeg Jets", division_id: 4)
st_louis_blues = Team.create(name: "St Louis Blues", division_id: 4)
dallas_stars = Team.create(name: "Dallas Stars", division_id: 4)
colorado_avalanche = Team.create(name: "Colorado Avalanche", division_id: 4)
chicago_blackhawks = Team.create(name: "Chicago Blackhawks", division_id: 4)
minnesota_wild = Team.create(name: "Minnesota Wild", division_id: 4)

default_team = Team.create()