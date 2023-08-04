require_relative 'pieces'

class Knight < Pieces

  def initialize(color, tile)
    @piece = 'knight'
    @color = color
    @symbol = @color == 'white' ? ' ♘ ' : ' ♞ '
    @tile = tile
    @next_moves = []
    @status = 'unmoved'
  end

  def reach
    [[[-2,-1],[-2,1],[-1,-2],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]]
  end

end
