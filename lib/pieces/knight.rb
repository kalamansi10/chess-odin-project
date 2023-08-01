class Knight
  attr_accessor :piece, :position, :symbol, :color
  
  def initialize(color, position)
    @piece = 'knight'
    @color = color
    @symbol = @color == 'white' ? ' ♘ ' : ' ♞ '
    @position = position
  end

  def legal_moves(board)
  end

  def can_move?
  end

  private

  @reach = [-27, -15, 15, 27]

end