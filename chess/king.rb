require_relative 'piece'
require_relative 'stepping_piece'
class King < Piece
  include Steppable
  def initialize(pos, color)
    super("king", pos, color)
  end

  def to_s
    @color == 'black' ? '♔' : '♚' 
  end

  def moves
    self.king_moves
  end
end
