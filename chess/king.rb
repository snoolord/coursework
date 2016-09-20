require_relative 'piece'
require_relative 'stepping_piece'
class King < Piece
  include Steppable
  def initialize(pos)
    super("king", pos)
  end

  def moves
    self.king_moves
  end
end
