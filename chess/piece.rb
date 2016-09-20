class Piece
  attr_accessor :highlight, :name, :pos

  def initialize(name, pos, color)
    @name = name
    @pos = pos
    @color = color
  end

  def to_s
    'P'
  end

  def valid_moves?(board)

  end
end
