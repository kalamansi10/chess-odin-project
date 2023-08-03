class King
  attr_reader :piece, :color, :symbol
  attr_accessor :tile, :next_moves, :status

  def initialize(color, tile)
    @piece = 'king'
    @color = color
    @symbol = @color == 'white' ? ' ♔ ' : ' ♚ '
    @tile = tile
    @next_moves = []
    @status = 'unmoved'
  end

  def reach
    [[[-1,0],[0,-1],[0,1],[1,0]]]
  end
  
end
