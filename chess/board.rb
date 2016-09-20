require_relative 'pieces'
require_relative 'nullpiece'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def setup_board
    [0,7].each do |x|
      self.board[x][0] = Rook.new([x,0])
      self.board[x][1] = Knight.new([x,1])
      self.board[x][2] = Bishop.new([x,2])
      self.board[x][3] = King.new([x,3])
      self.board[x][4] = Queen.new([x,4])
      self.board[x][5] = Bishop.new([x,5])
      self.board[x][6] = Knight.new([x,6])
      self.board[x][7] = Rook.new([x,7])
    end

    p @board
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

board = Board.new
board.setup_board
