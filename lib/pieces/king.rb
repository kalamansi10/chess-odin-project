require_relative 'pieces'

class King < Pieces

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

  def is_checked?
    
  end
  
end
