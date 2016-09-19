require 'colorize'
require_relative 'cursor'
require_relative 'board'


class Display
  attr_accessor :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
  end

end
