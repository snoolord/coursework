require_relative 'pieces'
require_relative 'nullpiece'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { [] } }
    @board[0][0] = Piece.new
    @board[0][1] = Piece.new
  end


  def [](pos)
    x , y = pos
    @board[x][y]
  end

  def move(start,end_pos)
    x , y = start
    i , j = end_pos
    raise "There's no piece here" unless @board[x][y].is_a?(Piece)
    raise "There's already a piece here" if @board[i][j].is_a?(Piece)
    @board[x][y], @board[i][j] = @board[i][j], @board[x][y]
  end
end

rook = Rook.new
