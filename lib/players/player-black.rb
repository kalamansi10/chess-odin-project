require_relative '../pieces/bishop'
require_relative '../pieces/king'
require_relative '../pieces/knight'
require_relative '../pieces/pawn'
require_relative '../pieces/queen'
require_relative '../pieces/rook'

class BlackPlayer
  attr_accessor :name, :pieces

  def initialize(name)
    @name = name
    @pieces = [King.new('black', 5),
              Pawn.new('black', 16),
              Pawn.new('black', 15),
              Pawn.new('black', 14),
              Pawn.new('black', 13),
              Pawn.new('black', 12),
              Pawn.new('black', 11),
              Pawn.new('black', 10),
              Pawn.new('black', 9),
              Rook.new('black', 8),
              Knight.new('black', 7),
              Bishop.new('black', 6),
              Queen.new('black', 4),
              Bishop.new('black', 3),
              Knight.new('black', 2),
              Rook.new('black', 1)]
              
  end
end
