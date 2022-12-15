require_relative 'player.rb'

class Game
    attr_reader :remaining_turns

    def initialize
        @remaining_turns = 12
    end

    def startGame
        @computerPlayer = Player.new("maker")
        @userPlayer = Player.new("breaker")
        win = false
        puts "\nYou are the breaker of the code! Guess your computer's hidden code."
        puts "You will be given feedback on how close your guess is.\n"
        puts "○ means one of your guesses is found in the secret code but in the wrong place."
        puts "● means one of your guesses is found in the secret code and in the right place."
        while @remaining_turns > 0
            @num_correct_guesses = 0
            @num_semi_correct_guesses = 0
            
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

            if @userPlayer.code == @computerPlayer.code
                winActivate()
                win = true
                break
            else
                checkSimilarities()
                c_guess = '● ' * @num_correct_guesses
                s_guess = '○ ' * @num_semi_correct_guesses 
                puts "Feedback: " + c_guess + s_guess
            end

            @remaining_turns -= 1
        end
        if win == false
            loseActivate()
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
        puts "Congratulations! You guessed the secret code!"
    end

    def loseActivate
        puts "You lose! You are not yet ready to defeat the AI"
    end

    def checkSimilarities
        correct_guesses = []
        semi_correct_guesses = []
        userCode = @userPlayer.code
        secretCode = @computerPlayer.code
        
        for color in secretCode do
            if userCode.include? color
                if userCode.find_index(color) == secretCode.find_index(color)
                    correct_guesses.push(color)
                else
                    semi_correct_guesses.push(color)
                end
            end
        end

        @num_correct_guesses = correct_guesses.length
        @num_semi_correct_guesses = semi_correct_guesses.length
    end
end