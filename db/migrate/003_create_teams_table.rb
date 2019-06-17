class CreateTeamsTable < ActiveRecord::Migration[4.2]
    def change
        create_table :teams do |t|
            t.string :name
            t.integer :division_id
        end
    end
end