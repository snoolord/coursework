class Queen < Piece
  include Slidable
  def initialize(pos, color)
    super("queen", pos, color)
  end

  def to_s
    @color == 'black' ? '♕' : '♛'
  end

  def moves
    self.diagonal_moves + self.vertical_and_horizontal_moves
    #left, right, down_left, down_right, up, down, left, right
  end
end
