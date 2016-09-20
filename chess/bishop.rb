class Bishop < Piece
  include Slidable  
  def initialize
    super("bishop", [2,2])
  end

  def moves
    self.diagonal_moves
  end
end
