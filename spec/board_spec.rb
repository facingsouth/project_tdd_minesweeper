require "board"

describe Board do

  let(:b) { Board.new }
  let(:gamestate) { b.instance_variable_get(:@gamestate)
}
  describe "#initialize" do

    it "should have a 10X10 board array" do

      expect(gamestate).to be_a(Array)
      expect(gamestate.length).to eq(10)
      expect(gamestate[0].length).to eq(10)

    end

    it "should have 9 mines" do


    end

  end

end