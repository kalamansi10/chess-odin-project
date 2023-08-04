require_relative '../pieces/bishop'
require_relative '../pieces/king'
require_relative '../pieces/knight'
require_relative '../pieces/pawn'
require_relative '../pieces/queen'
require_relative '../pieces/rook'

class WhitePlayer
  attr_accessor :name, :pieces

  def initialize(name)
    @name = name
    @pieces = [King.new('white', 61)
              Pawn.new('white', 49),
              Pawn.new('white', 50),
              Pawn.new('white', 51),
              Pawn.new('white', 52),
              Pawn.new('white', 53),
              Pawn.new('white', 54),
              Pawn.new('white', 55),
              Pawn.new('white', 56),
              Rook.new('white', 57),
              Knight.new('white', 58),
              Bishop.new('white', 59),
              Queen.new('white', 60),
              Bishop.new('white', 62),
              Knight.new('white', 63),
              Rook.new('white', 64)]
    
  end
end
