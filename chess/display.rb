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
    # @board.board.each do |row|
    #   row = row.map do |tile|
    #     if tile.is_a?(Piece) && tile.highlight == true
    #       "P".colorize(:background => :light_blue)
    #     elsif tile.is_a?(NullPiece) && tile.highlight == true
    #       " ".colorize(:background => :light_blue)
    #     elsif tile.is_a?(Piece)
    #       "P"
    #     elsif tile.is_a?(NullPiece)
    #       " "
    #     else
    #       " "
    #     end
    #   end
    #
    #   puts row.join(" | ")
    #   puts "*" * 30
    # end
    @board.board.each_with_index do |row, rindex|
      row.each_with_index do |column, cindex|
        if [rindex, cindex] == @cursor.cursor_pos
          print column.to_s.colorize(:background => :light_blue)
        else
          print column
        end
      end
      puts
    end


  end
  def check_cursor
    while true
      render
      input = @cursor.get_input
      system('clear')
    end
  end
end

board = Board.new
board.setup_board
display = Display.new(board)
display.check_cursor
