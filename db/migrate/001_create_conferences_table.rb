class CreateConferencesTable < ActiveRecord::Migration[4.2]
    def change
        create_table :conferences do |t|
            t.string :name
        end
    end
end