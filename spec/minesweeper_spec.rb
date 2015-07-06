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
      allow(minesweeper.player).to receive(:get_move).and_return([2, 4])
      expect(minesweeper.player).to receive(:get_move)
      minesweeper.play

    end

    it 'should reveal the space the player selected' do
      
      allow(minesweeper.player).to receive(:get_move).and_return([2, 4])
      expect(minesweeper.board).to receive(:reveal_space)
      minesweeper.play
    end

  end

end