class Rook
  attr_accessor :piece, :position, :symbol, :color

  def initialize(color, position)
    @piece = 'rook'
    @color = color
    @symbol = @color == 'white' ? ' ♖ ' : ' ♜ '
    @position = position
  end

  def legal_moves(board)
  end

  def can_move?
  end

  private

  @reach = [-56, -48, -40, -32,
            -24, -16, -8, -7,
            -6, -5, -4, -3,
            -2, -1, 1, 2,
            3, 4, 5, 6,
            7, 8, 16, 24,
            32, 40, 48, 56]
end