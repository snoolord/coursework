class Knight < Piece
  include  Steppable
  def initialize(pos, color)
    super("knight", pos, color)
  end

  def to_s
    @color == 'black' ? '♞'.colorize(:black) : '♞' 
  end

  def moves
    self.knight_moves
  end
end
