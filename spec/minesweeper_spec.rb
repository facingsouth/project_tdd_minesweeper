require 'minesweeper.rb'

describe Minesweeper do

  let(:minesweeper) {Minesweeper.new}
  let(:board) {Board.new}

  describe '#initialize' do



    it "should initialize a game board" do

      expect(board).to be_a(Board)

    end

  end

  describe '#play' do

    it "should call render on the board"

    it "should call get_move on the player" do

      expect(minesweeper.player).to receive(:get_move)
      minesweeper.play

    end

    it 'should reveal the space the player selected'

  end

end