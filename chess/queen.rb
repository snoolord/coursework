class Queen < Piece
  include Slidable
  def initialize(pos)
    super("queen", pos)
  end

  def moves
    self.diagonal_moves + self.vertical_and_horizontal_moves
    #left, right, down_left, down_right, up, down, left, right
  end
end
