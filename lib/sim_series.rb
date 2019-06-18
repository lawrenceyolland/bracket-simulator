
# def sim_playoff_series(m)
#     score = []
#     ot_options = [1,-1]
#     # 7.times do
#     until [bool_count(score, true), bool_count(score, false)].any?(4)
#         # score_tally(score).count(true) == 4 || score_tally(score).count(false) == 4
#         total_goals_possible = rand(1..10) #10
#         team_1_goals = rand(total_goals_possible)
#         team_2_goals = (total_goals_possible-team_1_goals)        
#         ot = rand(1)
#         team_1_goals == team_2_goals ? team_1_goals+=ot_options[ot] : team_1_goals # overtime 
#         score << "#{team_1_goals}-#{team_2_goals}"
#     end
#     # end
#     if bool_count(score, true) > bool_count(score, false)
#         # score_tally(score).count(true) > score_tally(score).count(false)
#         m.winner_id = m.player1_id 
#     else 
#         m.winner_id = m.player2_id 
#     end
#     score_csv = score.join(",")
# end

# def score_tally(score)
#     score.collect {|s| s[0]>s[2]}
# end

# def bool_count(score, bool)
#     score_tally(score).count(bool)
# end
