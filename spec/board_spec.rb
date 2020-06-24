require './lib/board'
# let (:turn_x) { 'X' }
# let ()

describe Board do
  let(:gameboard) { Board.new }
  # let(:board)

  describe '#display' do
    it 'should output a grid for the board' do
      expect(gameboard.display).to eq(print("  ┌———┬———┬———┐     ░
        | - | - │ - │     ░   1   2   3
        ├———┼———┼———┤     ░
        | - | - │ - │     ░   4   5   6
        ├———┼———┼———┤     ░
        | - | - │ - │     ░   7   8   9
        └———┴———┴———┘     ░"))
    end
  end

  describe '#horizontal_winner?(player)' do
    it 'should return true when all three board[] positions are the same' do
      gameboard.update(1, 'X')
      gameboard.update(2, 'X')
      gameboard.update(3, 'X')
      # @board[0] = @board[1] = @board[2] = 'X'
      # expect(gameboard.board[0] && gameboard.board[1] && gameboard.board[2] == 'X').to eq(true)
      expect(gameboard.horizontal_winner?('X')).to eq(true)
    end
    # it 'should return false when not horizontal winner' do

    # end
  end
end
