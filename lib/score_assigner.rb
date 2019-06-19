require "pry"
example_csv = ["6-1","3-2","1-2","5-1","4-5","4-3"]

def give_goals(player_selector, goal_assigner)
    puts "player#{player_selector} scored #{goal_assigner} goals"
end

game_goals = example_csv.sum{|s| s[0].to_i}
current_goals = game_goals 
puts game_goals
until current_goals == 0
    player_selector = rand(4)
    goal_assigner = rand(1..current_goals)
    current_goals = current_goals - goal_assigner
    give_goals(player_selector, goal_assigner)
end
binding.pry
# 


