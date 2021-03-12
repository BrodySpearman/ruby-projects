require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'
require_relative 'show.rb'

def play_game
  game = Game.new
  game.play
  loop_game
end

def loop_game
  puts 'Would you like to play another game? hit Y for yes and N for no.'
  loop_input = gets.chomp.downcase
  if loop_input == 'y'
    play_game
  else
    puts 'Goodbye.'
  end
end

play_game
