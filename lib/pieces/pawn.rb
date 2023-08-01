class Pawn
  attr_accessor :piece, :position, :symbol, :color
  
  def initialize(color, position)
    @piece = 'knight'
    @color = color
    @symbol = @color == 'white' ? ' ♙ ' : ' ♟︎ '
    @position = position
  end

  def legal_moves(board)
  end

  def can_move?
  end

  private

  @reach = @color == 'white' ? [-7, -8, -9] : [ 7, 8, 9]

end