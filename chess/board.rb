require_relative 'piece'
require_relative 'nullpiece'

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) { [] } }
    @board[0][0] = Piece.new
    @board[0][1] = Piece.new
  end

  def render
    @board.each do |row|
      row = row.map do |tile|
        if tile.is_a?(Piece)
          "P"
        else
          " "
        end
      end

      puts row.join(" | ")
      puts "*" * 30
    end
  end

  def move(start,end_pos)
    x , y = start
    i , j = end_pos
    raise "There's no piece here" unless @board[x][y].is_a?(Piece)
    raise "There's already a piece here" if @board[i][j].is_a?(Piece)
    @board[x][y], @board[i][j] = @board[i][j], @board[x][y]
  end
end
