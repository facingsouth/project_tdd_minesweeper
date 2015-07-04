class Board



  def initialize

    #initialze 3d array. first two dimensions are locaton, 3rd dimensions
    #is array information.

    #first number is number of bombs around square. 
    #Or if 9, then square is mine.

    #second number corresponds to Flag, or Question marker placed
    #by player. See hash in render method.


    @gamestate = Array.new(10) {Array.new(10) {[0,-4]}}
    set_mines

  end


  def render

    system "clear"

    calculate_gamestate
    # 0 => full-square
    # -1 => full 
    hash = {0 => "\u25A1", -1 => "\u2691", -2 => '?', -3 => "\u25A0",
            1 => "1", 2 => "2",3 => "3", 4 => "4", 5 => "5",
            6 => "6", 7=> "7", 8 => "8", 9 => "\u2600"}
    # @gamestate.each {|i| p i}


    10.times do |cols|
      10.times do |rows|    
        if @gamestate[cols][rows][1] == -4
          print (hash[@gamestate[cols][rows][0]]);
          print "\s"
        else 
          print (hash[@gamestate[cols][rows][1]]);
          print "\s"        
        end
      end
      print "\n"
    end

  end

  def set_mines

    mines = (0..99).to_a.shuffle[0..8]
    cols = mines.map {|n| n/10}
    rows = mines.map {|n| n%10}

    9.times do |i|
      @gamestate[cols[i]][rows[i]][0] = 9
    end
  end

  def calculate_gamestate

    10.times do |cols|
      10.times do |rows| 
        unless @gamestate[cols][rows][0] == 9
          @gamestate[cols][rows][0] = check_nearby_mines(cols,rows, 9)
        end
      end
    end
  
  end



  def reveal(arr)

    @gamestate[arr[0]][arr[1]][1] = -4
  #   check_nearby == 0
  #     reveal 

  end



  private

  def check_nearby_mines(col, row, num)

    arr = [up?(row, col, 9), down?(row, col, 9),
          left?(row, col, 9), right?(row, col, 9),
          diag_up_right?(row, col, 9), diag_up_left?(row, col, 9), 
          diag_down_left?(row, col, 9), diag_down_right?(row, col, 9)]


     arr.count {|bool| bool==true} 

    # counter = 0 
    # counter +=1 if up? 
    # counter +=1 if down? 
    # counter +=1 if left? 
    # counter +=1 if right? 
    # counter +=1 if diag_up_right? 
    # counter +=1 if diag_up_left? 
    # counter +=1 if diag_down_right? 
    # counter +=1 if diag_down_left?
    # return counter
  end

  def left?(row, col, num)

    true if col > 0 && @gamestate[col - 1][row][0] == num
  end

  def right?(row, col, num)
    true if col < 9 && @gamestate[col + 1][row][0] == num
  end

  def up?(row, col, num)
    true if row < 9 && @gamestate[col][row + 1][0] == num
  end

  def down?(row, col, num)
    true if row > 0 && @gamestate[col][row - 1][0] == num
  end

  def diag_up_right?(row, col, num)
    true if row < 9 && col < 9 && @gamestate[col + 1][row + 1][0] == num
  end

  def diag_up_left?(row, col, num)
    true if row < 9 && col > 0 && @gamestate[col - 1][row + 1][0] == num
  end

  def diag_down_right?(row, col, num)
    true if row > 0 && col < 9 && @gamestate[col + 1][row - 1][0] == num
  end

  def diag_down_left?(row, col, num)
    true if row > 0 && col > 0 && @gamestate[col - 1][row - 1][0] == num
  end




end









# ms = Board.new

# ms.render