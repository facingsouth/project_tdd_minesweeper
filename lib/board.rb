class Board

  attr_accessor :gamestate

  def initialize(gamestate = nil)

    @gamestate = gamestate || Array.new(100){|i| Space.new(i/10,i%10)}


    # p @gamestate[90].neighbors

    set_mines unless gamestate

    calculate_gamestate


  end


  def render

    system "clear"

    100.times do |i|

      @gamestate[i].set_render
      print ((i/10).to_s + "\n") if i%10 == 0 && i != 0
      print @gamestate[i].render

      @gamestate[i].render.chomp!

    end
    print "10\n"
    print "1 2 3 4 5 6 7 8 9 10\n"
    


  end



  def reveal_space(move)

    @gamestate[move].hidden = false
      if @gamestate[move].number == 0
        reveal_neighbors(move)

      end

  end


  private

  def reveal_neighbors(i)
    @gamestate[i].neighbors.each do |j|
      reveal_space(j) unless @gamestate[j].hidden == false
    end
     
  end

  

  def set_mines

    mines = (0..99).to_a.shuffle[0..8]

    p mines.sort


    mines.each do |i|
      @gamestate[i].is_a_mine = true
      p @gamestate[i].coords
    end
  end

  def calculate_gamestate

    100.times do |i|

      @gamestate[i].number = check_nearby_mines(i)



    end

  end



  # def reveal_nieghbor(i)
  
  #   nieghbors.each |n|
  #     reveal unless n.is_a_mine && n.number == 0
  
  
  # end





  def check_nearby_mines(i) 


    arr = [up?(i), down?(i), left?(i), right?(i), diag_up_right?(i), 
          diag_up_left?(i), diag_down_left?(i), diag_down_right?(i)]



     arr.count {|bool| bool==true}


  end

  def right?(i)

    true if i%10 != 9 && @gamestate[i+1].is_a_mine == true

  end

  def left?(i)


    true if i%10 != 0 && @gamestate[i-1].is_a_mine == true

  end

  def up?(i)
    true if i/10  != 0 && @gamestate[i-10].is_a_mine == true

  end

  def down?(i)
    true if i/10  != 9 && @gamestate[i+10].is_a_mine == true

  end

  def diag_up_right?(i)
    true if i%10 != 9  && i/10 != 0 && @gamestate[i - 9].is_a_mine == true


  end

  def diag_up_left?(i)
    true if i%10 != 0  && i/10 != 0 && @gamestate[i - 11].is_a_mine == true

  end

  def diag_down_right?(i)
    true if i%10 != 9  && i/10 != 9 && @gamestate[i + 11].is_a_mine == true

  end

  def diag_down_left?(i)

    true if i%10 != 0  && i/10 != 9 && @gamestate[i + 9].is_a_mine == true



  end





end
