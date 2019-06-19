class GameMode
    def coin_flip
        # Flip a coin ...
        puts "Heads or Tails?"
        input = gets.chomp
        rand(0..1).round == 0 ? coin = "Heads" : coin = "Tails"
        # mario cart power up sound effect
        if coin.downcase == input.downcase
        puts "#{coin.upcase} "+ "Grats"
        else
        puts "Soz it's #{coin.upcase}"
        puts "ELIMINATED"
        # end game sound effects
        end
    end

    def price_is_right
        # Higher or lower?
        puts "Higher or Lower?"
        puts "You have three shots at this"
        puts "Good Luck"
        # i = 0
        fails = []
        # while fails.count == 0
        real = rand(0..50)
        fake = rand(0..50)  
        puts "#{fake} is more or less than our real number?"
        input = gets.chomp.downcase
        if input == "higher"
            fake > real ? "Grats" : "Eliminated"
        elsif input == "lower"
            fake < real ? "Grats" : "Eliminated"
        end
    end

end