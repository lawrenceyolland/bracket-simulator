# require_relative '../config/access.rb'
# require_relative '../lib/assign_goals.rb'
Challonge::API.username = Access.username
Challonge::API.key = Access.api_key

t = Challonge::Tournament.new
t.name = 'Stabley Cup 6000'
t.url = SecureRandom.hex(10)# randomly generates a 10 character string
 
t.tournament_type = 'single elimination'
t.save

url = "https://api.challonge.com/v1/tournaments/" + t.id.to_s + "/participants/bulk_add.json"

cli = CommandLineInterface.new
rounds = Round.new(t)
teams = cli.team_hash

Player.all.each do |player|
    player.series_goals = 0
    player.save 
end

teams["api_key"] = Challonge::API.key 
RestClient.post(url, teams)

t.start! # t.post(:start)

#~~~~~~~~~~~~~~~~~RANDOMISE SERIES SCORES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
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
    if bool_count(score, true) > bool_count(score, false)
        m.winner_id = m.player1_id 
    else 
        m.winner_id = m.player2_id 
    end
    # score_csv = score
    score
end

def score_tally(score)
    score.collect {|s| s[0]>s[2]}
end

def bool_count(score, bool)
    score_tally(score).count(bool)
end

#~~~~~~RUN SERIES AND SUBMIT MATCHES ~~~~~~~~~~~~~~~#
def update_matches(t, i)
    m = t.matches[i]
# ~~~~~~~~~ Assign goals to players ~~~~~~~~~~~~~~~~#
    ag = AssignGoals.new

    team1_id = ag.team_1_id(m)
    team2_id = ag.team_2_id(m)

    player1_list = ag.get_player_list(team1_id)
    player2_list = ag.get_player_list(team2_id)

    scores = sim_playoff_series(m) # defined in sim_series
    m.scores_csv = scores.join(",")

    # assign team 1 players some goals
    ag.assign_goals(scores, team1_id, team1_id, player1_list)
    # assign team 2 players some goals
    ag.assign_goals(scores, team2_id, team1_id, player2_list)

    player1_list.each { |p| p.save}
    player2_list.each { |p| p.save}

    m
end

def roll_credits(t)
    t.post(:finalize)
    base_url = "https://api.challonge.com/v1/tournaments/" + t.id.to_s + ".json"
    RestClient.delete(base_url, {"api_key" => Challonge::API.key })
    puts "ROll CREDITS"
end

rounds.run_round


