require_relative 'pieces'

class Knight < Pieces
  def initialize(color, tile)
    @piece = 'N'
    @color = color
    @symbol = @color == 'white' ? ' ♘ ' : ' ♞ '
    @tile = tile
    @move_list = []
    @status = 'unmoved'
  end

  def reach
    [[[-2, -1]], [[-2, 1]], [[-1, -2]], [[-1, 2]], [[1, -2]], [[1, 2]], [[2, -1]], [[2, 1]]]
  end
end
