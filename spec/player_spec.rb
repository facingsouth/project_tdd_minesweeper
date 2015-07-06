require 'player'

describe Player do
  let (:player){Player.new}
  
  describe '#get_move' do

    it 'should get input from the player' do
      allow(player).to receive(:gets).and_return("2","4")
      expect(player).to receive(:gets)
      player.get_move



    end



    it 'should check valid input' do

      allow(player).to receive(:gets).and_return("2","4")
      allow(player).to receive(:valid_input?).and_return(true)
      expect(player).to receive(:valid_input?).with("4","2")

      player.get_move

    end


    specify 'valid input should return true if valid and false if not' do

      allow(player).to receive(:gets).and_return("adf", "b", "2", "3","abc","def")

      expect(player.get_move).to eql([3,2])


    end


  end


end