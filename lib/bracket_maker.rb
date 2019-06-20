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

Team.all.each do |team|
    team.wins = 0
    team.losses = 0
    team.save 
end

teams["api_key"] = Challonge::API.key 
RestClient.post(url, teams)

t.start! # t.post(:start)

#~~~~~~~~~~~~~~~~~RANDOMISE SERIES SCORES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~RUN SERIES AND SUBMIT MATCHES ~~~~~~~~~~~~~~~#
def update_matches(t, i)
    m = t.matches[i]
# ~~~~~~~~~ Assign goals to players ~~~~~~~~~~~~~~~~#
    ar = AssignResults.new

    team1_id = ar.team_1_id(m)
    team2_id = ar.team_2_id(m)

    player1_list = ar.get_player_list(team1_id)
    player2_list = ar.get_player_list(team2_id)

    scores = ar.sim_playoff_series(m) # defined in sim_series
    m.scores_csv = scores.join(",")

    # randomly assign team 1 players some goals
    ar.assign_goals(scores, team1_id, team1_id, player1_list)
    # randomly assign team 2 players some goals
    ar.assign_goals(scores, team2_id, team1_id, player2_list)

    player1_list.each { |p| p.save}
    player2_list.each { |p| p.save}

    t1_wins, t2_wins = ar.win_tally(scores)

    # binding.pry

    ar.give_win(team1_id, t1_wins, scores)
    ar.give_win(team2_id, t2_wins, scores)

    team1 = ar.get_team(team1_id)
    team2 = ar.get_team(team2_id)

    team1.each { |wl| wl.save}
    team2.each { |wl| wl.save}

    m
end

def roll_credits(t)
    t.post(:finalize)
    # base_url = "https://api.challonge.com/v1/tournaments/" + t.id.to_s + ".json"
    # RestClient.delete(base_url, {"api_key" => Challonge::API.key })
    puts "ROll CREDITS"
    # t.destroy
end

rounds.run_round


