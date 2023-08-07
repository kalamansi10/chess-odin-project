require_relative 'players'

class PlayerWhite < Players
  def initialize
    @color = 'white'
    @pieces = [King.new('white', 61),
              Rook.new('white', 57),
              Rook.new('white', 64),
              Pawn.new('white', 49),
              Pawn.new('white', 50),
              Pawn.new('white', 51),
              Pawn.new('white', 52),
              Pawn.new('white', 53),
              Pawn.new('white', 54),
              Pawn.new('white', 55),
              Pawn.new('white', 56),
              Knight.new('white', 58),
              Bishop.new('white', 59),
              Queen.new('white', 60),
              Bishop.new('white', 62),
              Knight.new('white', 63)]
  end
end
