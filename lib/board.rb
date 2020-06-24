class Board
  attr_reader :board

  def initialize
    play_again
  end

  def play_again
    @board = Array.new(9, '-')
  end

  def display
    print("  ┌———┬———┬———┐     ░\n")
    print("  | #{board[0]} | #{board[1]} │ #{board[2]} │     ░   1   2   3\n")
    print("  ├———┼———┼———┤     ░\n")
    print("  | #{board[3]} | #{board[4]} │ #{board[5]} │     ░   4   5   6\n")
    print("  ├———┼———┼———┤     ░\n")
    print("  | #{board[6]} | #{board[7]} │ #{board[8]} │     ░   7   8   9\n")
    print("  └———┴———┴———┘     ░\n")
  end

  def update(choice, player)
    board[choice - 1] = player
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity

  def horizontal_winner?(player)
    if board[0] == player && board[1] == player && board[2] == player
      true
    elsif board[3] == player && board[4] == player && board[5] == player
      true
    elsif board[6] == player && board[7] == player && board[8] == player
      true
    else
      false
    end
  end

  def vertical_winner?(player)
    if board[0] == player && board[3] == player && board[6] == player
      true
    elsif board[1] == player && board[4] == player && board[7] == player
      true
    elsif board[2] == player && board[5] == player && board[8] == player
      true
    else
      false
    end
  end

  def diagonal_winner?(player)
    if board[0] == player && board[4] == player && board[8] == player
      true
    elsif board[6] == player && board[4] == player && board[2] == player
      true
    else
      false
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  def win?(turn)
    horizontal_winner?(turn) || vertical_winner?(turn) || diagonal_winner?(turn)
  end

  def valid(choice)
    (1..9).include?(choice)
  end

  def taken?(choice)
    board[choice - 1] != '-'
  end

  def tie?
    !board.include?('-')
  end
end

new_board = Board.new
new_board.display
