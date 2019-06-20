class Player < ActiveRecord::Base
   belongs_to :team

   def self.reset_series_goals
      self.all.each do |player|
         player.series_goals = 0
         player.save 
      end
   end

   def self.reset_total_goals
      self.all.each do |player|
         player.total_goals = 0
         player.save 
      end
   end

end
