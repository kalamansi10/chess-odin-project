require_relative 'pieces'

class Rook < Pieces
  def initialize(color, tile)
    @piece = 'R'
    @color = color
    @symbol = @color == 'white' ? ' ♖ ' : ' ♜ '
    @tile = tile
    @move_list = []
    @status = 'unmoved'
  end

  def reach
    [[[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]],
     [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]],
     [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]],
     [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]]
  end
end
