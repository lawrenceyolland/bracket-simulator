
require_relative '../config/environment.rb'

cli = CommandLineInterface.new

Challonge::API.username = Access.username
Challonge::API.key = Access.api_key

t = Challonge::Tournament.new
t.name = 'Bracket Generator Test'
t.url = SecureRandom.hex(10) # randomly generates a 10 character string
t.tournament_type = 'single elimination'
t.save

url = "https://api.challonge.com/v1/tournaments/" + t.id.to_s + "/participants/bulk_add.json"
teams = cli.team_hash
teams["api_key"] = Challonge::API.key 
RestClient.post(url, teams)
t.start! # t.post(:start)

full_tournament = 0..14

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
    score_csv = score.join(",")
end

def score_tally(score)
    score.collect {|s| s[0]>s[2]}
end

def bool_count(score, bool)
    score_tally(score).count(bool)
end

def update_matches(t, i)
    m = t.matches[i]
    m.scores_csv = sim_playoff_series(m) # defined in sim_series
    m
end

for i in full_tournament
    update_matches(t,i).save
end
# Launchy::Browser.run(t.live_image_url)
# if t.matches(:first).player1_id == t.matches(:first).winner_id 
#     puts "want them chips with the dip" 
# else
#     puts "unfortunately you lost"
# end
t.post(:finalize)



