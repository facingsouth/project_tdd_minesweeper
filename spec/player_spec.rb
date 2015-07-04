=begin 

Player
  can pick moves
  tell board to unhide spaces
  put flags or question-marks

=end


require 'player'


describe Player do 
  let (:player){Player.new}

  it 'should return an array of moves' do
    allow(player).to receive(:gets).and_return(4,6)
    expect(player.get_move).to eql([3,5])
  end


  
end