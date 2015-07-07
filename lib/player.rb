class Player

  def get_move

    puts "Which row you want to pick? (1 to 10)"
    col = Integer(gets.strip) -1 rescue -1

    puts "Which col you want to pick? (1 to 10)"
    row = Integer(gets.strip) -1 rescue -1

    until valid_input?(row, col)
      puts "Your input is not valid."

      puts "Which row you want to pick? (1 to 10)"
      col = Integer(gets.strip) -1 rescue -1

      puts "Which col you want to pick? (1 to 10)"
      row = Integer(gets.strip) -1 rescue -1
    end

    (col * 10 + row)

  end


  private

  def valid_input?(row, col)

 

    return false unless (0..9).include?(row)

    return false unless (0..9).include?(col)

    return true
  end

end