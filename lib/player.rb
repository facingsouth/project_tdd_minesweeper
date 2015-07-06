class Player

  def get_move

    puts "Which col you want to pick? (0 to 9)"
    col = gets.strip

    puts "Which row you want to pick? (0 to 9)"
    row = gets.strip

    until valid_input?(row, col)
      puts "Your input is not valid."

      puts "Which col you want to pick? (0 to 9)"
      col = gets.strip

      puts "Which row you want to pick? (0 to 9)"
      row = gets.strip
    end

    [@row.to_i, @col.to_i]

  end


  def valid_input?(row, col)

    return false if row.length != 1 || col.length != 1

    return false unless (0..9).include?(Integer(row)) rescue false

    return false unless (0..9).include?(Integer(col)) rescue false

    return true
  end

end