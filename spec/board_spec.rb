require './lib/board'

describe Board do
  let(:gameboard) { Board.new }
  describe '#play_again' do
    it 'should output an array of 9 dashes' do
      expect(gameboard.play_again).to eq(%w[- - - - - - - - -])
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

  describe '#taken?(choice)' do
    it 'should return true if cell position is not a dash' do
      gameboard.update(1, 'X')
      expect(gameboard.taken?(1)).to eq(true)
    end
    it 'should return false if cell position is a dash' do
      gameboard.update(1, '-')
      expect(gameboard.taken?(1)).to eq(false)
    end
  end

  describe 'tie?' do
    it 'Board is filled up, no winner, it is a tie' do
      gameboard.update(1, 'X');  gameboard.update(2, 'O');  gameboard.update(3, 'O')
      gameboard.update(4, 'O');  gameboard.update(5, 'X');  gameboard.update(6, 'X')
      gameboard.update(7, 'X');  gameboard.update(8, 'O');  gameboard.update(9, 'O')
      expect(gameboard.tie?).to eq(true)
    end
  end
end
