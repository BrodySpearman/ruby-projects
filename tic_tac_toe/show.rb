module Show
  def show_intro
    "Welcome to Tic-Tac-Toe! \n\n"
  end

  def get_names(num)
    "Who is player ##{num}"
  end

  def get_symbol
    'What letter would you like your marker to be?'
  end

  def show_first_symbol(duplicate)
    "Symbol can not be '#{duplicate}'"
  end

  def show_invalid_answer
    'Sorry, your input is invalid, type another number.'
  end

  def show_player_turn(name, symbol)
    "#{name}, enter a number between 1 and 9 to place a/an '#{symbol}'."
  end

  def show_winner(name)
    "Game over, #{name} is the winner."
  end

  def show_tie
    'You have tied.'
  end
end
