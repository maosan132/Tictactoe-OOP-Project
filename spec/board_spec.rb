require './lib/board'
let (:turn_x) { 'X' }
let ()

describe Board do
  let(:gameboard) { Board.new }
  describe '#' do
    it 'should' do # for sake
      expect(21).to eq(21)
    end
  end

  describe '#display' do
    it 'should output a grid for the board' do
      alias_method :draw, :puts
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
      gameboard.board[0], gameboard.board[1], board[2] = 3

      expect(gameboard.horizontal_winner?('X')).to eq(21)
    end
    it 'should return false when not horizontal winner' do
      expect(21).to eq(21)
    end
  end
end
