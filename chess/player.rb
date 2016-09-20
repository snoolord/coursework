require_relative 'display'

class Player
  def initialize(display)
    @display = display
  end

  def get_input
    @display.render
    start_pos = @display.get_move
    end_pos = @display.get_move
    @display.board.move(start_pos, end_pos)
    system('clear')
    @display.render
  end


end

board = Board.new
board.setup_board
display = Display.new(board)
player = Player.new(display)
player.get_input
