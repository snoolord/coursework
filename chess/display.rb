require 'colorize'
require_relative 'cursor'
require_relative 'board'


class Display
  attr_accessor :cursor, :board
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
      rindex.even? ? color = :light_black : color = :light_blue
      row.each_with_index do |column, cindex|
        color == :light_black ? color = :light_blue : color = :light_black
        print ' '.colorize(:background => color)
        if [rindex, cindex] == @cursor.cursor_pos
          print column.to_s.colorize(:background => :green)
        else
          print column.to_s.colorize(:background => color)
        end
        print ' '.colorize(:background => color)
      end
      puts
    end
  end

  def get_move
    cursor = true
    while cursor
      render
      input = @cursor.get_input
      p input
      if input == :return
        position = @cursor.cursor_pos
        cursor = false
      end
      # system('clear')
    end
    position
  end
end
