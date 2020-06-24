require './lib/board'
require 'pry'
# let (:turn_x) { 'X' }
# let ()

describe Board do
  let(:gameboard) { Board.new }
  # let(:board)
  describe '#play_again' do
    it 'should output an array of 9 dashes' do
      expect(gameboard.play_again).to eq(%w[- - - - - - - - -])
    end
  end

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
      gameboard.update(1, 'Y')
      gameboard.update(2, 'X')
      gameboard.update(3, 'Y')
      # binding.pry
      expect(gameboard.horizontal_winner?('X')).to eq(false)
    end
  end

  describe '#vertical_winner?(player)' do
    it 'should return true when get a vertical line of symbol X' do
      gameboard.update(1, 'X')
      gameboard.update(4, 'X')
      gameboard.update(7, 'X')
      expect(gameboard.vertical_winner?('X')).to eq(true)
    end
    it 'should return false when not get a vertical line of symbol X' do
      gameboard.update(1, 'Y')
      gameboard.update(4, 'X')
      gameboard.update(7, 'Y')
      # binding.pry
      expect(gameboard.vertical_winner?('X')).to eq(false)
    end
  end

  describe '#diagonal_winner?(player)' do
    it 'should return true when get a diagonal line of symbol X' do
      gameboard.update(0, 'X')
      gameboard.update(4, 'X')
      expect(gameboard.diagonal_winner?('X')).to eq(true)
    end
    it 'should return false when not get a diagonal line of symbol X' do
      gameboard.update(0, 'Y')
      gameboard.update(4, 'X')
      # binding.pry
      expect(gameboard.diagonal_winner?('X')).to eq(false)
    end
  end
end
