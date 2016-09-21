require 'colorize'
class Piece
  attr_accessor :highlight, :name, :pos, :color

  def initialize(name, pos, color)
    @name = name
    @pos = pos
    @color = color
  end

  def to_s
    'P'
  end

  def valid_moves(board)
    moves = self.moves
    valid_moves = []

    moves = moves.map { |pair_array| pair_array.select { |pair| pair[0].between?(0, 7) && pair[1].between?(0, 7) } }

    moves.each do |pair_array|
      pair_array.each do |pair|
        piece_check = board[pair[0]][pair[1]]
        if piece_check.is_a?(Piece)
          if piece_check.color != self.color
            valid_moves << pair
          end
          break
        else
          valid_moves << pair
        end

      end
    end

    p valid_moves

  end
end
