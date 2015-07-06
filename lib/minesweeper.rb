require_relative './board.rb'
# require_relative './player.rb'
require_relative './space.rb'
require_relative './player.rb'

class Minesweeper

  attr_reader :board, :player

  def initialize

    @board = Board.new
    @player = Player.new

  end

  def play

    @board.render
    @player.get_move

  end





end
