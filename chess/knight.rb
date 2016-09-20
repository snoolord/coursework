class Knight < Piece
  include  Steppable
  def initialize(pos)
    super("knight", pos)
  end

  def moves
    self.knight_moves
  end
end
