class Round
    attr_accessor :round, :t

    def initialize(round = 0, t, player_team)
        @round = round
        @t = t
        @player_team = player_team
    end

    def round_menu
        if self.track_player_team 
            puts "Congratulations" # 
        else    
            puts "Sorry your team has been eliminated"
        end
        titles = ["First Round", "Second Round", "Conference Finals", "Stanley Cup Final"]
        prompt = TTY::Prompt.new
        answer = prompt.select("#{titles[self.round]} complete") do |menu|
            menu.choice "View Results", 1
            menu.choice "Team Stats", 2
            if round == 3
                menu.choice "Exit", 3 
            elsif menu.choice "Simulate Next Round", 4
            end
        end
        if answer == 1
            self.launch_bracket
            self.round_menu
        elsif answer == 2
            self.team_menu
        elsif answer == 3
            self.t.post(:finalize)
            self.t.destroy
            system 'clear'
            puts "ROLL CREDITS"
        elsif answer == 4
            system 'clear'
            self.increase_round
            self.run_round 
        end
    end

    def team_menu
        list = ["Go Back"]
        list << team_series_data
        prompt = TTY::Prompt.new
        answer = prompt.select("Select Team:", list)
        make_team_table(answer)
    end

    def ranges
        [0..7, 8..11, 12..13, 14..14]
    end

    def launch_bracket
        Launchy::Browser.run("https://challonge.com/" + self.t.url + "/fullscreen")
        system "clear"
    end

    def run_round
        for i in ranges[round]
            update_matches(self.t, i).save
        end
        self.round_menu 
    end

    def increase_round
        self.round += 1
    end

    def make_team_table(answer)
        if answer == "Go Back"
            system 'clear'
            round_menu
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
        team_menu
        end
    end

    def team_series_data
        teams = []
        team_1 = t.matches.collect{|p| p.player1.name}[self.ranges[self.round]]
        team_2 = t.matches.collect{|p| p.player2.name}[self.ranges[self.round]]
        teams << [team_1, team_2].flatten
        teams.flatten
    end

    def track_player_team
        self.team_series_data.include?(@player_team) #^^^^^^^^ this need to be for next round (check player team is in round+1)
    end
    
end

