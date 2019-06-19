
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

def player_team
    prompt = TTY::Prompt.new
    player_team = prompt.multi_select("Select your team:", teams)
    player_team
end


teams["api_key"] = Challonge::API.key 
RestClient.post(url, teams)
t.start! # t.post(:start)

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

for i in 0..7
    update_matches(t,i).save
end
# binding.pry
live_url = "https://challonge.com/" + t.url + "/fullscreen"
Launchy::Browser.run(live_url)
# t.live_image_url
# if t.matches(:first).player1_id == t.matches(:first).winner_id 
#     puts "want them chips with the dip" 
# else
#     puts "unfortunately you lost"
# end

prompt = TTY::Prompt.new
answer = prompt.select("First Round Complete:") do |menu|
    menu.choice "Team Stats", 1
    menu.choice "Player Stats", 2
    menu.choice "Simulate Second Round", 3
end
if answer == 3
    for i in 8..11
        update_matches(t,i).save
    end
end

prompt = TTY::Prompt.new
answer = prompt.select("Second Round Complete:") do |menu|
    menu.choice "Team Stats", 1
    menu.choice "Player Stats", 2
    menu.choice "Simulate Conference Finals", 3
end
if answer == 3
    for i in 12..13
        update_matches(t,i).save
    end
end

prompt = TTY::Prompt.new
answer = prompt.select("Conference Finals Complete:") do |menu|
    menu.choice "Team Stats", 1
    menu.choice "Player Stats", 2
    menu.choice "Simulate Stanley Cup Final", 3
end
if answer == 3
        update_matches(t,14).save
end

t.post(:finalize)



