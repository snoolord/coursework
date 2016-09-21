require_relative 'pieces'
require_relative 'nullpiece'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def setup_grid
    color = 'black'
      self.grid[0][0] = Rook.new([0,0], color)
      self.grid[0][1] = Knight.new([0,1], color)
      self.grid[0][2] = Bishop.new([0,2], color)
      self.grid[0][3] = King.new([0,3], color)
      self.grid[0][4] = Queen.new([0,4], color)
      self.grid[0][5] = Bishop.new([0,5], color)
      self.grid[0][6] = Knight.new([0,6], color)
      self.grid[0][7] = Rook.new([0,7], color)
      self.grid[3][4] = Rook.new([3,4], color)
    color = 'white'
      self.grid[7][0] = Rook.new([7,0], color)
      self.grid[7][1] = Knight.new([7,1], color)
      self.grid[7][2] = Bishop.new([7,2], color)
      self.grid[7][3] = King.new([7,3], color)
      self.grid[7][4] = Queen.new([7,4], color)
      self.grid[7][5] = Bishop.new([7,5], color)
      self.grid[7][6] = Knight.new([7,6], color)
      self.grid[7][7] = Rook.new([7,7], color)
      self.grid[5][2] = Rook.new([5,2], color)
      self.grid[1][3] = Rook.new([1,3], color)
  end

  def [](pos)
    x , y = pos
    @grid[x][y]
  end

  def move(start,end_pos)
    x , y = start
    i , j = end_pos
    valid_moves = self.grid[x][y].valid_moves(@grid)

    raise "There's no piece here" unless @grid[x][y].is_a?(Piece)
    raise "There's already a piece here" if @grid[i][j].is_a?(Piece)
    @grid[x][y], @grid[i][j] = @grid[i][j], @grid[x][y]
  end

  def valid_move
  end
end
