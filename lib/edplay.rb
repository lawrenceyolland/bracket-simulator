
def round_menu(t, round)
    round_counter = round
    titles = ["First Round", "Second Round", "Conference Finals", "Stanley Cup Final"]
    prompt = TTY::Prompt.new
    answer = prompt.select("#{titles[round]} complete") do |menu|
        menu.choice "View Results", 1
        menu.choice "Team Stats", 2
        round == 4 ? menu.choice = "Exit", 3 : menu.choice "Simulate Next Round", 4
    end
    if answer == 1
        launch_bracket(t)
        round_menu(t,round)
    elsif answer == 2
        team_menu(t)
    elsif answer == 3
        roll_credits(t)
    # Second round
    elsif answer == 4
        run_next_round(t, round) # make this next  round +=1  //// starts at zeroooo
    end
end

def team_menu(t, round)
ranges = [0..7, 8..11, 12..13, 14]
list = team_series_data(ranges[round], t)
list << "Go Back"
    prompt = TTY::Prompt.new
    answer = prompt.select("Select Team:", list)
    make_team_table1(t, answer)
end

def make_team_table1(t, answer)
if answer == "Go Back"
    round_menu1(t)
else
team = Team.all.find_by(name: answer)
puts team.img_path
rows = []
rows << [team.name, team.wins, team.losses, team.games_played, team.championship_wins]
table = Terminal::Table.new :headings => ["Name", "Wins", "Losses", "Games Played", "Championship Wins"], :rows => rows 
puts table
players = Player.all.select { |p| p.team_id == team.id}
rows2 = []
players.each { |e| rows2 << [e.name, e.series_goals, e.total_goals]} # add goals per game
table2 = Terminal::Table.new :headings => ["Name", "Series Goals", "Total Goals"], :rows => rows2 
puts table2
team_menu1(t)
end
# PROMPT TO TEAM MENU 1 !!!
end
