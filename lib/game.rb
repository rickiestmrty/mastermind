require_relative 'player.rb'

class Game
    attr_reader :remaining_turns

    def initialize
        @remaining_turns = 12
        startGame
    end

    def startGame
        @computerPlayer = Player.new("maker")
        @userPlayer = Player.new("breaker")
        puts "You are the breaker of the code! Guess your computer's hidden code."

        while @remaining_turns > 0
            
            
            while true
                print "Type 4 unique integers (1-6): "
                guess = gets.chomp
                guess = guess.split("")
                if isValid?(guess)
                    guess.map! { |ele| ele.to_i }
                    break
                else
                    puts "Your input is invalid. Please try again"
                end
            end
            @userPlayer.updateCode(guess)
            p @userPlayer.code

            if @userPlayer.code == @computerPlayer.code
                winActivate()
            else


            @remaining_turns -= 1
        end
        
    end

    def isValid?(guess)
        valid = true
        if guess.length() == 4
            for ele in guess do
                if ele != ele.to_i.to_s
                    valid = false
                    break
                end
            end
            if guess.uniq.length != guess.length
                valid = false
            else
                
            end
        else
            valid = false
        end

        valid
    end

    def winActivate
    
    end

    def checkSimilarities
        correct_guesses = []
        

    end
end

game1 = Game.new