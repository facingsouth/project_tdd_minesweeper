class Player


  def get_move
    row = gets.to_i - 1
    col = gets.to_i - 1
    return [row,col]
  end

end