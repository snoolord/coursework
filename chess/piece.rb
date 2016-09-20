require_relative 'board'

class Piece
  attr_accessor :highlight, :name, :pos

  def initialize(name, pos)
    @name = name
    @pos = pos
    @highlight = false
  end

  def highlight_toggle
    @highlight ? @highlight = false : @highlight = true
  end
end
