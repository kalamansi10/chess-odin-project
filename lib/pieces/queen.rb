class Queen
  attr_accessor :piece, :position, :symbol, :color

  def initialize(color, position)
    @piece = 'queen'
    @color = color
    @symbol = @color == 'white' ? ' ♕ ' : ' ♛ '
    @position = position
  end

  def legal_moves(board)
  end

  def can_move?
  end

  private

  @reach = [-63, -56, -54, -49,
            -48, -45, -42, -40,
            -36, -35, -32, -28,
            -27, -24, -21, -18,
            -16, -14, -9, -8,
            -7, -7, -6, -5,
            -4, -3, -2, -1,
            1, 2, 3, 4,
            5, 6, 7, 7,
            8, 9, 14, 16,
            18, 21, 24, 27,
            28, 32, 35, 36,
            40, 42, 45, 48,
            49, 54, 56, 63]
end