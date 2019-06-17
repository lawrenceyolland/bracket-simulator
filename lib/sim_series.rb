
def sim_playoff_series
    score = []
    ot_options = [1,-1]
    7.times do
        total_goals_possible = rand(1..10)
        team_1_goals = rand(1..total_goals_possible)
        team_2_goals = (total_goals_possible-team_1_goals)

        puts "team1:#{team_1_goals} team2:#{team_2_goals}"
    
        ot = rand(0..1)
        team_1_goals == team_2_goals ? team_1_goals+=ot_options[ot] : team_1_goals # overtime 
        score << "#{team_1_goals}-#{team_2_goals}"
    end
    score.join(",")
end
