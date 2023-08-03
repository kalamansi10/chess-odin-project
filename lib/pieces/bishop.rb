class Bishop
  attr_reader :piece, :color, :symbol
  attr_accessor :tile, :next_moves, :status

  def initialize(color, tile)
    @piece = 'bishop'
    @color = color
    @symbol = @color == 'white' ? ' ♗ ' : ' ♝ '
    @tile = tile
    @next_moves = []
    @status = 'unmoved'
  end

  def reach
    [[[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]],
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]],
    [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]],
    [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]]
  end

end
