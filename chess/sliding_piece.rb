require_relative 'piece'

module Slidable
  def vertical_and_horizontal_moves
    x,y = self.pos
    up, down, left, right = [], [], [], []
    total_possible_moves = []
    (x-1).downto(0) { |index| up << [index, y] }
    ((x + 1)..7).each { |index| down << [index, y] }
    (y-1).downto(0) { |index| left << [x, index] }
    (( y + 1 )..7).each { |index| right << [x, index] }
    total_possible_moves << up << down << left << right
    total_possible_moves
  end

  def diagonal_moves
    x,y = self.pos
    possible_moves = []
    left, right, down_left, down_right = [], [], [], []
    (1..7).each { |index| left << [x + index, y + index] }
    (1..7).each { |index| right << [x + index, y - index] }
    (1..7).each { |index| down_left << [x - index, y + index] }
    (1..7).each { |index| down_right << [x - index, y - index] }
    possible_moves << left << right << down_left << down_right
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
