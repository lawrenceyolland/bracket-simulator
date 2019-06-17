class CreateDivisionsTable < ActiveRecord::Migration
    def change
        create_table :divisions do |t|
            t.string :name
            t.integer :conference_id
        end
    end
end