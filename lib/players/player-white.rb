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
    @pieces = []
    @pieces << Pawn.new('white', 49)
    @pieces << Pawn.new('white', 50)
    @pieces << Pawn.new('white', 51)
    @pieces << Pawn.new('white', 52)
    @pieces << Pawn.new('white', 53)
    @pieces << Pawn.new('white', 54)
    @pieces << Pawn.new('white', 55)
    @pieces << Pawn.new('white', 56)
    @pieces << Rook.new('white', 57)
    @pieces << Knight.new('white', 58)
    @pieces << Bishop.new('white', 59)
    @pieces << Queen.new('white', 60)
    @pieces << King.new('white', 61)
    @pieces << Bishop.new('white', 62)
    @pieces << Knight.new('white', 63)
    @pieces << Rook.new('white', 64)
  end
end
