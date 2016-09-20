class Bishop < Piece
  include Slidable
  def initialize(pos)
    super("bishop", pos)
  end

  def moves
    self.diagonal_moves
  end
end
