class AssignResults
    
    def team_1_id(m)
        Team.all.find_by(name: m.player1.name).id
    end

    def team_2_id(m)
        Team.all.find_by(name: m.player2.name).id
    end

    def get_player_list(team_x_id)
        Player.all.select { |p| p.team_id == team_x_id}
    end

    def give_goals(player, goal_assigner)
        player.series_goals += goal_assigner
        player.total_goals += goal_assigner
        player.save
    end

    def player_goal_calculator(player_list, current_goals)
        until current_goals == 0
            goal_assigner = rand(1..current_goals)
            current_goals -= goal_assigner
            player = player_list[rand(4)]
            give_goals(player, goal_assigner)
        end
    end

    def assign_goals(scores, team_id, team_1_id, player_list)
        team_id == team_1_id ? n = 0 : n = 2
        current_goals = scores.sum { |s| s[n].to_i}
        player_goal_calculator(player_list, current_goals)
    end

    def sim_playoff_series(m)
        score = []
        ot_options = [1,-1]
        until [bool_count(score, true), bool_count(score, false)].any?(4)
            total_goals_possible = rand(1..10) #10
            team_1_goals = rand(total_goals_possible)
            team_2_goals = (total_goals_possible-team_1_goals)        
            ot = rand(1)
            team_1_goals == team_2_goals ? team_1_goals+=ot_options[ot] : team_1_goals # overtime 
            score << "#{team_1_goals}-#{team_2_goals}"
        end
        if self.bool_count(score, true) > self.bool_count(score, false)
            m.winner_id = m.player1_id
        else 
            m.winner_id = m.player2_id 
        end
        # score_csv = score
        score
    end

    def score_tally(score)
        score.collect { |s| s[0]>s[2]}
    end
    
    def bool_count(score, bool)
        self.score_tally(score).count(bool)
    end

    def win_tally(score)
        return self.bool_count(score, true), self.bool_count(score, false)
    end

    def give_win(team_x_id, team_wins, score)
        team = Team.all.find{|t| t.id == team_x_id}
        team.wins += team_wins
        team.losses += (self.number_of_games(score) - team_wins)
        team.games_played += number_of_games(score)
        team.save
    end

    def number_of_games(score)
        score.count
    end

    def get_team(team_x_id)
        Team.all.select { |team| team.id == team_x_id}
    end
end
