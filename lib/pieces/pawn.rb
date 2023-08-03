class Pawn
  attr_reader :piece, :color, :symbol
  attr_accessor :tile, :next_moves, :status

  def initialize(color, tile)
    @piece = 'knight'
    @color = color
    @symbol = @color == 'white' ? ' ♙ ' : ' ♟︎ '
    @tile = tile
    @next_moves = []
    @status = 'unmoved'
  end

  def reach
    
  end

end
