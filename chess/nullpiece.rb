require 'singleton'

class NullPiece
  include Singleton

  attr_accessor :highlight

  def initialize
    @highlight = false
  end

  def highlight_toggle
    @highlight ? @highlight = false : @highlight = true
  end
end
