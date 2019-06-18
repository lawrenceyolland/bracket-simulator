class CreatePlayersTable < ActiveRecord::Migration[4.2]
    def change
        create_table :players do |t|
            t.string :name
            t.integer :goals
            t.string :team_id
        end
    end
end