require './lib/board'
require 'pry'

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
      expect(gameboard.vertical_winner?('X')).to eq(false)
    end
  end

  describe '#diagonal_winner?(player)' do
    it 'should return true when get a diagonal line of symbol X' do
      gameboard.update(1, 'X')
      gameboard.update(5, 'X')
      gameboard.update(9, 'X')
      expect(gameboard.diagonal_winner?('X')).to eq(true)
    end
    it 'should return false when not get a diagonal line of symbol X' do
      gameboard.update(7, 'Y')
      gameboard.update(5, 'X')
      gameboard.update(3, 'Y')
      expect(gameboard.diagonal_winner?('X')).to eq(false)
    end
  end

  describe '#valid(choice)' do
    it 'should return true only if player chose a digit' do
      expect(gameboard.valid(1)).to be(true)
      expect(gameboard.valid(2)).to be(true)
      expect(gameboard.valid(3)).to be(true)
      expect(gameboard.valid(4)).to be(true)
      expect(gameboard.valid(5)).to be(true)
      expect(gameboard.valid(6)).to be(true)
      expect(gameboard.valid(7)).to be(true)
      expect(gameboard.valid(8)).to be(true)
      expect(gameboard.valid(9)).to be(true)
    end
    it 'should return false if player doesn\'t chose a digit' do
      expect(gameboard.valid(10)).to be(false)
      expect(gameboard.valid('apple')).to be(false)
    end
  end

  # describe '#taken?(choice)' do
  #   it 'description' do
  #   end
  # end

  # describe 'tie?' do
  #   it 'description' do
  #   end
  # end
end
