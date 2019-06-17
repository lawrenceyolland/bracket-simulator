require_relative "config.rb"
require_relative "queries.rb"
require_relative "environment.rb"
require_relative "sim_series.rb"

Challonge::API.username = Access.username
Challonge::API.key = Access.api_key

t = Challonge::Tournament.new
t.name = 'Bracket Generator Test'
t.url = SecureRandom.hex(10) # randomly generates a 10 character string
t.tournament_type = 'single elimination'
t.save

# t.errors.full_messages => useful if errors are thrown

# query_params = {
#     "api_key": Challonge::API.username,
#     "tournament[name]": 'Basic Single Elim Tournament',
#     "tournament[url]": SecureRandom.hex(10),
# } 

# this url can change when we start requiring different queries/slugs etc
url = "https://api.challonge.com/v1/tournaments/" + t.id.to_s + "/participants/bulk_add.json"

teams = team_hash
teams["api_key"] = Challonge::API.key # to be moved to teams.rb
 
RestClient.post(url, teams)

t.start! # t.post(:start)
# binding.pry
# m = t.matches(:first)
# match_url = "https://api.challonge.com/v1/tournaments/" + m.tournament.id.to_s + "/matches/" + m.id.to_s + ".json"

# query_params = {
#     "api_key"=>Challonge::API.key,
#     "match[scores_csv]"=> '1-0',
#     "match[winner_id]"=> m.player1_id
# }
# RestClient.post(url, query_params)

# t.live_image_url / t.full_challonge_url are available 
full_tournament = 0..14

def update_matches(t, i)
    m = t.matches[i]
    m.scores_csv = sim_playoff_series(m) # defined in sim_series
    m
end

for i in full_tournament
    update_matches(t,i).save
    Launchy::Browser.run(t.live_image_url)
end

# Launchy::Browser.run(t.live_image_url)
if t.matches(:first).player1_id == t.matches(:first).winner_id 
    puts "want them chips with the dip" 
else
    puts "unfortunately you lost"
end
# binding.pry
t.post(:finalize)
