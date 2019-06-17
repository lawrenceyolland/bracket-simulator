class CreateTeamsTable < ActiveRecord::Migration
    def change
        create_table :teams do |t|
            t.string :name
            t.integer :divisions_id
        end
    end
end