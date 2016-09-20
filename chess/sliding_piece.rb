require_relative 'piece'

module Slidable
  def horizontal_and_vertical_moves
    start_pos = self.pos
    x,y = start_pos
    possible_moves = []
    (0..7).each do |index|
      possible_moves << [index, y]
      possible_moves << [x, index]
      p possible_moves
    end
    p possible_moves
  end
  def diagonal_moves
    start_pos = self.pos
    x, y = start_pos
    possible_moves = []
    (0..7).each do |index|
      possible_moves << [x + index, y + index]
      possible_moves << [x - index, y + index]
      possible_moves << [x + index, y - index]
      possible_moves << [x - index, y - index]
    end
