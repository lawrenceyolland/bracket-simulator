class Round
    attr_accessor :round, :t

    def initialize(round = 0, t, player_team)
        @round = round
        @t = t
        @player_team = player_team
    end

    def round_menu
        teamlist = Team.all.select { |team| team.wins == (self.round+1)*4}
        team_to_check = Team.find_by(name: @player_team)
        if teamlist.include?(team_to_check)
            puts "Congratulations" 
        else
            puts "Sorry your team the #{@player_team} has been eliminated"
        end
        titles = ["First Round", "Second Round", "Conference Finals", "Stanley Cup Final"]
        prompt = TTY::Prompt.new
        answer = prompt.select("#{titles[self.round]} complete") do |menu|
            menu.choice "View Results", 1
            menu.choice "Team Stats", 2
            if round == 3
                menu.choice "Next", 3 
            elsif menu.choice "Simulate Next Round", 4
            end
        end
        if answer == 1
            self.launch_bracket
            self.round_menu
        elsif answer == 2
            self.team_menu
        elsif answer == 3
            self.chips_and_dip
            self.t.post(:finalize)
            self.t.destroy
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
        answer = prompt.select("Select Team:", list, per_page: 17)
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
        puts ""
        rows = []
        rows << [team.name, team.wins, team.losses, team.games_played, team.championship_wins]
        table = Terminal::Table.new :headings => ["Name", "Wins", "Losses", "Games Played", "Championship Wins"], :rows => rows 
        puts table
        players = Player.all.select { |p| p.team_id == team.id}
        rows2 = []
        players.each { |e| rows2 << [e.name, e.series_goals, e.total_goals, e.goals_per_game]} 
        table2 = Terminal::Table.new :headings => ["Name", "Series Goals", "Total Goals", "Goals Per Game"], :rows => rows2 
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

    def chips_and_dip
        system 'clear'
        pid = fork{ exec 'afplay', 'lib/assets/outro_song.mp3' } 
        winner = Team.all.find_by(wins: 16)
        eastern_champs, western_champs = conference_winners 
        centered_text("#{winner.name.upcase} WIN THE STANLEY CUP!")
        sleep 4
        centered_text("#{eastern_champs} won the Eastern Conference and are awarded The Prince of Wales Trophy!")
        sleep 4
        centered_text("#{western_champs} won the Western Conference and are awarded The Clarence S. Campbell Trophy!")
        sleep 4
        centered_text("#{conn_smythe.name} won the Conn Smythe Trophy for most valuable player!")
        sleep 4
        centered_text "> P R O D U C E D  B Y"
        sleep 0.5
        centered_text "  P R O D U C E D  B Y"
        sleep 0.5
        centered_text "> P R O D U C E D  B Y"
        sleep 0.5
        centered_text "  P R O D U C E D  B Y"
        system "clear"
        centered_text "E D  W E B B E R              L A W R E N C E  Y O L L A N D"
        sleep 15
        pid = fork{ exec 'killall', 'afplay' }
    end

    def conn_smythe
        winner = Team.all.find_by(wins: 16)
        players = Player.all.where(team_id: winner.id)
        players.sort_by { |p| p.series_goals}.first
    end

    def conference_winners
        cw = Team.all.where("wins >= 12")
        eastern_champs = cw[0].name
        western_champs = cw[1].name
        return eastern_champs, western_champs
    end

    def insert_spaces(n)
        n.times { puts " \n" }
    end

    def pad_half_screen
        spaces = IO.console.winsize[0] / 2
        insert_spaces(spaces)
    end

    def centered_text(text)
        width = IO.console.winsize[1] / 2
        pad_half_screen
        puts "#{" " * (width - (text.length / 2))}#{text}"
        pad_half_screen
    end
end

