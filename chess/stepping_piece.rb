require_relative 'piece'

module Steppable
  def king_moves
    x, y = self.pos
    possible_moves = [0, -1, 1] * 2
    possible_moves = possible_moves.combination(2).to_a.uniq
    possible_moves.delete([0,0])
    possible_moves

    possible_moves.map { |arr| [arr[0] + x, arr[1] + y] }

  end

  def knight_moves
    x, y = self.pos
    possible_moves = [[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[1,-2],[1,2],[-1,2]]
    possible_moves.map { |arr| [arr[0] + x, arr[1] + y] }
  end
end
