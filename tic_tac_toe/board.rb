class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  WINNING_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def visible
    puts <<-HEREDOC
       #{cells[0]} | #{cells[1]} | #{cells[2]}
      ---+---+---
       #{cells[3]} | #{cells[4]} | #{cells[5]}
      ---+---+---
       #{cells[6]} | #{cells[7]} | #{cells[8]}
    HEREDOC
  end

  def mark(num, symbol)
    @cells[num] = symbol
  end

  def move_is_valid?(num)
    cells[num - 1] == num
  end

  def full_board?
    cells.all? { |cell| cell =~ /[^0-9]/ }
  end

  def complete?
    WINNING_COMBOS.any? do |combo|
      [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
    end
  end
end
