require 'singleton'

class NullPiece
  attr_accessor :highlight

  def initialize
    @highlight = false
  end
  
  def highlight_toggle
    @highlight ? @highlight = false : @highlight = true
  end
end
