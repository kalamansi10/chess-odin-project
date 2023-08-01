class Bishop
  attr_accessor :piece, :position, :symbol, :color

  def initialize(color, position)
    @piece = 'bishop'
    @color = color
    @symbol = @color == 'white' ? ' ♗ ' : ' ♝ '
    @position = position
  end

  def legal_moves
    moves = []
    crit = 8
    @nw.each do |move|
      break if move (@position - move) > (@position - crit)
      moves << (@position - move)
      crit += 8
    end
    moves
  end

  private
  @nw = [-9, -18, -27, -36, -45, -54, -63]

  @nw = [-63, -54, -45, -36, -27, -18, -9]-
  @ne = [-49. -42, -35, -28, -21, -14, -7]
  @sw = [7, 14, 21, 28, 35, 42, 49]
  @se = [9, 18, 27, 36, 45, 54, 63]

end