require_relative './board.rb'
require_relative './space.rb'
require_relative './player.rb'

class Minesweeper

  attr_reader :board, :player

  def initialize

    @board = Board.new
    @player = Player.new

  end

  def play

    @move = 0


    until defeat?
      @board.render
      @move = @player.get_move
        # break if defeat?
      @board.reveal_space(@move)
    end

    @board.render


    


  end


  def game_end?

    victory? || defeat? || quit?

  end

  def defeat?
    puts @board.gamestate[@move]
    @board.gamestate[@move].is_a_mine


  end

  def victory?
    false
  end

  def quit?
    false
  end


end









