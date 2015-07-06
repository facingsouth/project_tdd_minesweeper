require 'space'

class Board

  attr_reader :gamestate

  def initialize(gamestate = nil)

    @gamestate = gamestate || Array.new(100){|i| Space.new(i/10,i%10)}


    # p @gamestate[90].neighbors

    set_mines

    calculate_gamestate


  end


  def render

    # system "clear"

    100.times do |i|

      @gamestate[i].set_render
      @gamestate[i].render.concat(10) if ((i % 10) + 1) == 10
      print @gamestate[i].render
      @gamestate[i].render.chomp

    end


  end


  private

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
