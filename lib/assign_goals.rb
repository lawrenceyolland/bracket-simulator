class AssignGoals
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
end
