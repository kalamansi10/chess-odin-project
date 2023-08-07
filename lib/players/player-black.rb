require_relative 'players'

class PlayerBlack < Players
  def initialize
    @color = 'black'
    @pieces = [King.new('black', 5),
      Rook.new('black', 1),
              Rook.new('black', 8),
              Pawn.new('black', 16),
              Pawn.new('black', 15),
              Pawn.new('black', 14),
              Pawn.new('black', 13),
              Pawn.new('black', 12),
              Pawn.new('black', 11),
              Pawn.new('black', 10),
              Pawn.new('black', 9),
              Knight.new('black', 7),
              Bishop.new('black', 6),
              Queen.new('black', 4),
              Bishop.new('black', 3),
              Knight.new('black', 2)]
  end
end
