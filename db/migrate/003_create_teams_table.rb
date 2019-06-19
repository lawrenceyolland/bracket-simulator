class CreateTeamsTable < ActiveRecord::Migration[4.2]
    def change
        create_table :teams do |t|
            t.string :name
            t.integer :wins
            t.integer :losses
            t.integer :games_played
            t.integer :championship_wins
            t.string :best_round
            t.string :img_path
            t.integer :division_id
        end
    end
end