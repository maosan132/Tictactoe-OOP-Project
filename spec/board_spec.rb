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
    it 'should return true when get a horizontal line of symbol X' do
      gameboard.update(1, 'X')
      gameboard.update(2, 'X')
      gameboard.update(3, 'X')
      expect(gameboard.horizontal_winner?('X')).to eq(true)
    end
    it 'should return false when not get a horizontal line of symbol X' do
      gameboard.update(4, 'Y')
      gameboard.update(5, 'X')
      gameboard.update(6, 'Y')
      expect(gameboard.horizontal_winner?('Y')).to eq(false)
    end
  end
end
