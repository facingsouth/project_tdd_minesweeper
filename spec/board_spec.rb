require 'board.rb'

describe Board do

  let(:board) { Board.new }

  describe '#initialize' do

    it "should initialize a Board object" do

      expect(board).to be_a(Board)

    end

    it "should initialize an array of length 100 as gamestate" do

      expect(board.gamestate).to be_a(Array)
      expect(board.gamestate.length).to eq(100)
      expect(board.gamestate[0]).to be_a(Space)

    end

  end

  describe "#render" do
  end

  

end