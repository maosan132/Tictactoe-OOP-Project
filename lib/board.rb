class Board
  attr_reader :board

  def initialize

    # @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    # @board = %W(\s \s \s \s \s \s \s \s \s)
    play_again
  end
  
  def play_again
    @board = Array.new(9, '-')
  end
  def display
    puts
    puts ' ' + board[0] + ' │ ' + board[1] + ' │ ' + board[2] + '    ░   1   2   3'
    puts '———┼———┼———' + (' ' * 3) + '░'
    puts ' ' + board[3] + ' │ ' + board[4] + ' │ ' + board[5] + '    ░   4   5   6'
    puts '———┼———┼———' + (' ' * 3) + '░'
    puts ' ' + board[6] + ' │ ' + board[7] + ' │ ' + board[8] + '    ░   7   8   9'
    puts
  end
  
  def update(cell_choice, current_player)
    if board[cell_choice-1] == '-'
      board[cell_choice-1] = current_player
    else
      
    end
  end
 
  def free_cell?
  end

  def valid?

  end

  def taken?

  end

  def tie?
    board.exclude?('-')
  end
end 