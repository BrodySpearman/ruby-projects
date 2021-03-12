require_relative 'show.rb'

class Game
  include Show
  attr_reader :player_one, :player_two, :board, :current_player

  def initialize
    @board = Board.new
    @current_player = nil
    @player_one = nil
    @player_two = nil
  end

  def play
    setup_game
    board.visible
    take_turns
    finish
  end

  def create_player(num, duplicate_symbol = nil)
    puts get_names(num)
    name = gets.chomp
    symbol = input_symbol(duplicate_symbol)
    Player.new(name, symbol)
  end

  def turn(player)
    cell = turn_input(player)
    board.mark(cell - 1, player.symbol)
    board.visible
  end

  private

  def setup_game
    puts show_intro
    @player_one = create_player(1)
    @player_two = create_player(2, player_one.symbol)
  end

  def input_symbol(duplicate)
    symbol_prompt(duplicate)
    input = gets.chomp
    return input if input.match?(/^[^0-9]$/) && input != duplicate

    puts show_invalid_answer
    input_symbol(duplicate)
  end

  def symbol_prompt(duplicate)
    puts get_symbol
    puts show_first_symbol(duplicate) if duplicate
  end

  def take_turns
    @current_player = player_one
    until board.full_board?
      turn(current_player)
      break if board.complete?

      @current_player = player_switch
    end
  end

  def turn_input(player)
    puts show_player_turn(player.name, player.symbol)
    num = gets.chomp.to_i
    return num if board.move_is_valid?(num)

    puts show_invalid_answer
    turn_input(player)
  end

  def player_switch
    if current_player == player_one
      player_two
    else
      player_one
    end
  end

  def finish
    if board.complete?
      puts show_winner(current_player.name)
    else
      puts show_tie
    end
  end
end
