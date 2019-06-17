class Team < ActiveRecord::Base
    belongs_to :divisions
    has_many :players
end
