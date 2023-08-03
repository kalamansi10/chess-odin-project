class Rook
  attr_reader :piece, :color, :symbol
  attr_accessor :tile, :next_moves, :status

  def initialize(color, tile)
    @piece = 'rook'
    @color = color
    @symbol = @color == 'white' ? ' ♖ ' : ' ♜ '
    @tile = tile
    @next_moves = []
    @status = 'unmoved'
  end

  def reach
    [[[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]],
    [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7]],
    [[0,-1],[0,-2],[0,-3],[0,-4],[0,-5],[0,-6],[0,-7]],
    [[-1,0],[-2,0],[-3,0],[-4,0],[-5,0],[-6,0],[-7,0]]]
  end
  
end
