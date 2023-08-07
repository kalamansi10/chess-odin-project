require_relative 'pieces'

class Bishop < Pieces
  def initialize(color, tile)
    @piece = 'B'
    @color = color
    @symbol = @color == 'white' ? ' ♗ ' : ' ♝ '
    @tile = tile
    @move_list = []
    @status = 'unmoved'
  end

  def reach
    [[[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]],
     [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]],
     [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]],
     [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]]
  end
end
