require 'singleton'

class NullPiece
  include Singleton

  attr_accessor :highlight

  def to_s
    return ' '
  end

  def highlight_toggle
    @highlight ? @highlight = false : @highlight = true
  end
end
