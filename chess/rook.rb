require_relative 'sliding_piece'
class Rook < Piece
  include Slidable
  def initialize
    super("rook",[0,2])
  end
end

rook = Rook.new
