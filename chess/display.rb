require 'colorize'
require_relative 'cursor'
require_relative 'board'


class Display
  attr_accessor :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @board.board.each do |row|
      row = row.map do |tile|
        if tile.is_a?(Piece) && tile.highlight == true
          "P".colorize(:background => :light_blue)
        elsif tile.is_a?(NullPiece) && tile.highlight == true
          " ".colorize(:background => :light_blue)
        elsif tile.is_a?(Piece)
          "P"
        elsif tile.is_a?(NullPiece)
          " "
        else
          " "
        end
      end

      puts row.join(" | ")
      puts "*" * 30
    end
  end
  def check_cursor
    while true
      render
      @cursor.get_input
    end
  end
end
