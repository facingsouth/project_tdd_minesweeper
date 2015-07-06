class Space

  attr_accessor :render, :is_a_mine, :number, :hidden, :coords






  def initialize(row,col)

    @row = row
    @col = col
    @coords = [@row, @col]
    @render = "\u25A0 "
    @is_a_mine = false
    @number = 0
    @hidden = false


  end

  def set_render
    @render = "\u25A1 " if !@hidden

    unless hidden
      if is_a_mine
        @render = "* "

      end
    end

    if @number > 0 && !is_a_mine
      unless hidden
        @render = "#{@number} "
      end
    end



  end


  # def neighbors

  #   i = @row*10 +@col


  #   [right_neighbor(i), left_neighbor(i), up_neighbor(i), 
  #    down_neighbor(i), diag_up_right_neighbor(i),
  #    diag_up_left_neighbor(i), diag_down_right_neighbor(i), 
  #    diag_down_left_neighbor(i)]

  # end

  # def right_neighbor(i)


  #   [@row, @col + 1] if i%10 != 9

  # end

  # def left_neighbor(i)


  #   [@row, @col - 1] if i%10 != 0

  # end

  # def up_neighbor(i)

  #   [@row - 1, @col] if i/10  != 0

  # end

  # def down_neighbor(i)

  #   [@row + 1, @col] if i/10  != 9

  # end

  # def diag_up_right_neighbor(i)

  #   [@row - 1, @col + 1] if i%10 != 9  && i/10 != 0


  # end

  # def diag_up_left_neighbor(i)

  #   [@row - 1, @col - 1] if i%10 != 0  && i/10 != 0

  # end

  # def diag_down_right_neighbor(i)

  #   [@row + 1, @col + 1] if i%10 != 9  && i/10 != 9

  # end

  # def diag_down_left_neighbor(i)

  #   [@row + 1, @col - 1] if i%10 != 0  && i/10 != 9

  # end





end
