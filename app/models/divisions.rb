class Division < ActiveRecord::Base
    belongs_to :conferences
    has_many :teams
end
