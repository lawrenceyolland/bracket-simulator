class CreatePlayersTable < ActiveRecord::Migration[4.2]
    def change
        create_table :players do |t|
            t.string :name
            t.integer :series_goals
            t.integer :total_goals
            t.integer :goals_per_game
            t.integer :team_id
        end
    end
end