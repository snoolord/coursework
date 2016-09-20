require_relative 'piece'
require_relative 'sliding_piece'
class Rook < Piece
  include Slidable
  def initialize(pos, color)
    super("rook", pos, color)
  end

  def to_s
    @color == 'black' ? '♖' : '♜'
  end

  def moves
    self.vertical_and_horizontal_moves
  end

end
