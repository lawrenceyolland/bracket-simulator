
# # this actually uses seeding. so 1 v 16 / 2 v 15 ...!
# # def team_hash
# #     query_params = {"participants"=> [
# #         {"name"=>"Nashville"},
# #         {"name"=>"Colorado"},
# #         {"name"=>"Anaheim"},
# #         {"name"=>"Tampa Bay"},
# #         {"name"=>"Calgary"},
# #         {"name"=>"Toronto"},
# #         {"name"=>"Rangers"},
# #         {"name"=>"St Louis"},
# #         {"name"=>"San Jose"},
# #         {"name"=>"Las Vegas"},
# #         {"name"=>"Washington"},
# #         {"name"=>"Dallas"},
# #         {"name"=>"Minnesota"},
# #         {"name"=>"Detroit"},
# #         {"name"=>"Islanders"},
# #         {"name"=>"New Jersey"}]}
# # end

def team_hash
        team_hash = {"participants"=>[]}
        # for i in input_ids      
        #         team_hash["participants"] << {"name"=>Team.find_by(id: i).name}
        # end
        for i in sorted_teams.flatten
                team_hash["participants"] << {"name"=>Team.find_by(name: i).name}
        end
        team_hash
end

# test = [["Montreal Canadiens", "Toronto Maple Leafs", "Boston Bruins", "Detroit Redwings"],
# ["New York Rangers", "Philadelphia Flyers", "New York Islanders", "Pittsburgh Penguins"],
# ["San Jose Sharks", "Las Vegas Golden Knights", "Anaheim Ducks", "Los Angeles Kings"],
# ["Colorado Avalanche", "Chicago Blackhawks", "Nashville Predators", "St Louis Blues"]]

# for i in test.flatten
#         team_hash["participants"] << {"name"=>Team.find_by(name: i).name}
# end
# def input_ids
# team_array = []
# until team_array.count == 16
#         input = gets.chomp
#         team_array << input.to_i
# end
# team_array
# end