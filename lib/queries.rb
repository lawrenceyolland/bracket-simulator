
# # this actually uses seeding. so 1 v 16 / 2 v 15 ...!
def default_team
    default_team = {"participants"=> [
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
end







# WORKING BELOW THIS LINE

# def team_test
#         team_test = {"participants"=>[]}
#         for i in test.flatten
#                 team_test["participants"] << {"name"=>Team.find_by(name: i).name}
#         end
#         team_test
# end