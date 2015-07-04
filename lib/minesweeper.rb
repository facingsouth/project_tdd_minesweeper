require_relative 'board.rb'
require_relative 'player.rb'

class Minesweeper

  def initialize
    @board = Board.new
    @player = Player.new


  end

  def play

    puts @board.class
    puts self.class
    puts @player.class
    @board.render
    @board.reveal(@player.get_move)
    @board.render



  end


end