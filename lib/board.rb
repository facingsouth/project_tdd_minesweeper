class Board


  def initialize

    @gamestate = Array.new(10) {Array.new(10) {[0,0]}}
    

  end


  def render

    @gamestate.each {|i| p i}

  end
                





end



# ms = Board.new

# ms.render