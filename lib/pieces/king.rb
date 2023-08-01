class King
  attr_accessor :piece, :position, :symbol, :color

  def initialize(color, position)
    @piece = 'king'
    @color = color
    @symbol = @color == 'white' ? ' ♔ ' : ' ♚ '
    @position = position
  end

  def legal_moves(board)
  end

  def can_move?
  end

  private

  @reach = [-8, -1, 1, 8]

end