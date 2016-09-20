require_relative 'sliding_piece'
require_relative 'piece'

class Rook < Piece
  include Slidable
  def initialize
    super("rook",[0,2])
  end

  def moves
    self.vertical_and_horizontal_moves
  end

end

rook = Rook.new
