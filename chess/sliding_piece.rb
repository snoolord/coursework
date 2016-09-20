require_relative 'piece'

module Slidable
  def horizontal_and_vertical_moves
    start_pos = self.pos
    x,y = start_pos
    possible_moves = []
    (0..7).each do |horizontal_index|
      next if horizontal_index == x
      possible_moves << [horizontal_index,y]
    end

    (0..7).each do |vertical_index|
      next if vertical_index == y
      possible_moves << [x , vertical_index]
    end
    possible_moves
  end
end
#
# ########
# require 'slidable'
#
# class Rook < Piece
#   include slidable
#   def initialize
#     super("rook")
#     @move_dirs = [[-1, 0], [1, 0]]
#   end
# end
#
# # Piece <- SlidingPiece <- Rook
# #
# # s = SlidingPiece.new()
# # s.move
#
# r = Rook.new
# r.move
