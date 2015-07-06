require 'board.rb'
require 'space.rb'

describe Board do




  let(:arr){Array.new(100){ |i| Space.new(i/10,i%10) }}
  


  let(:board) { Board.new }
  let(:custom){Board.new(arr)}

  describe '#initialize' do

    it "should initialize a Board object" do

      expect(board).to be_a(Board)

    end

    it "should initialize an array of length 100 as gamestate" do

      expect(board.gamestate).to be_a(Array)
      expect(board.gamestate.length).to eq(100)
      expect(board.gamestate[0]).to be_a(Space)

    end

    it 'should set 9 mines' do

      

      mine_count = 0

      100.times do |i|
        mine_count +=1 if board.gamestate[i].is_a_mine
      end

      expect(mine_count).to eql(9)


    end


    it 'should calculate_gamestate' do

    arr[44].is_a_mine = true
    arr[66].is_a_mine = true

      

      mine_count = 0 

      100.times do |i|
        mine_count +=1 if custom.gamestate[i].is_a_mine
      end


          expect(custom.gamestate[33].number).to eql(1)
          expect(custom.gamestate[34].number).to eql(1)
          expect(custom.gamestate[35].number).to eql(1)
          expect(custom.gamestate[43].number).to eql(1)
          expect(custom.gamestate[45].number).to eql(1)
          expect(custom.gamestate[53].number).to eql(1)
          expect(custom.gamestate[54].number).to eql(1)
          expect(custom.gamestate[55].number).to eql(2)
          expect(custom.gamestate[56].number).to eql(1)
          expect(custom.gamestate[57].number).to eql(1)
          expect(custom.gamestate[65].number).to eql(1)
          expect(custom.gamestate[67].number).to eql(1)
          expect(custom.gamestate[75].number).to eql(1)
          expect(custom.gamestate[76].number).to eql(1)
          expect(custom.gamestate[77].number).to eql(1)
          expect(custom.gamestate[23].number).to eql(0)
          expect(custom.gamestate[98].number).to eql(0)
          expect(custom.gamestate[50].number).to eql(0)
          expect(custom.gamestate[10].number).to eql(0)
          expect(custom.gamestate[99].number).to eql(0)
          
    end




  end

  describe "#reveal_space" do

    it "" do
      expect(board.gamestate[24].hidden).to be(false)
      board.reveal_space([2, 4])
    end
  end 






  

end