class CreateConferencesTable < ActiveRecord::Migration
    def change
        create_table :conferences do |t|
            t.string :name
        end
    end
end