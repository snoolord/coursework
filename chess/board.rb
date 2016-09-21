require_relative 'pieces'
require_relative 'nullpiece'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def setup_board
    color = 'black'
      self.board[0][0] = Rook.new([0,0], color)
      self.board[0][1] = Knight.new([0,1], color)
      self.board[0][2] = Bishop.new([0,2], color)
      self.board[0][3] = King.new([0,3], color)
      self.board[0][4] = Queen.new([0,4], color)
      self.board[0][5] = Bishop.new([0,5], color)
      self.board[0][6] = Knight.new([0,6], color)
      self.board[0][7] = Rook.new([0,7], color)
      self.board[3][4] = Rook.new([3,4], color)
    color = 'white'
      self.board[7][0] = Rook.new([7,0], color)
      self.board[7][1] = Knight.new([7,1], color)
      self.board[7][2] = Bishop.new([7,2], color)
      self.board[7][3] = King.new([7,3], color)
      self.board[7][4] = Queen.new([7,4], color)
      self.board[7][5] = Bishop.new([7,5], color)
      self.board[7][6] = Knight.new([7,6], color)
      self.board[7][7] = Rook.new([7,7], color)
      self.board[5][2] = Rook.new([5,2], color)
  end

  def [](pos)
    x , y = pos
    @board[x][y]
  end

  def move(start,end_pos)
    x , y = start
    i , j = end_pos
    valid_moves = self.board[x][y].valid_moves(@board)
    
    raise "There's no piece here" unless @board[x][y].is_a?(Piece)
    raise "There's already a piece here" if @board[i][j].is_a?(Piece)
    @board[x][y], @board[i][j] = @board[i][j], @board[x][y]
  end

  def valid_move
  end
end
