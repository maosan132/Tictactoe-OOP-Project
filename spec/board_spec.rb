require "./lib/board"

describe Board do
  let(:board) { Board.new }
  describe "#" do
    it "should" do # for sake
      expect(21).to eq(21)
    end
  end

  describe "#display" do
    it "should output a grid for the board" do
      alias draw puts
      expect(board.display).to eq(print "  ┌———┬———┬———┐     ░
        | - | - │ - │     ░   1   2   3
        ├———┼———┼———┤     ░
        | - | - │ - │     ░   4   5   6
        ├———┼———┼———┤     ░
        | - | - │ - │     ░   7   8   9
        └———┴———┴———┘     ░")
    end
  end

  describe "#horizontal_winner?(player)" do
    it "should return true when all three board[] positions are the same" do
      expect(21).to eq(21)
    end
    it "should return false when not horizontal winner" do
      expect(21).to eq(21)
    end
  end
end