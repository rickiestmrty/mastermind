require_relative 'lib/game.rb'

def startGame
    new_game = Game.new
    new_game.startGame
    rematchGame()
end

def rematchGame
    puts "Do you want to play another game? Type 'Y' to play again: "
    decision = gets.chomp
    decision = decision.upcase
    if decision == "Y" 
        startGame
    else
        puts "Let's play again next time! See you soon."
    end
end

startGame()