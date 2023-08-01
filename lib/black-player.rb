require_relative './pieces/bishop.rb'
require_relative './pieces/king.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/pawn.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/rook.rb'

class BlackPlayer
  attr_accessor :name, :pieces

  def initialize(name)
    @name = name
    @pieces = []
    @pieces << Pawn.new('black', 16)
    @pieces << Pawn.new('black', 15)
    @pieces << Pawn.new('black', 14)
    @pieces << Pawn.new('black', 13)
    @pieces << Pawn.new('black', 12)
    @pieces << Pawn.new('black', 11)
    @pieces << Pawn.new('black', 10)
    @pieces << Pawn.new('black', 9)
    @pieces << Rook.new('black', 8)
    @pieces << Knight.new('black', 7)
    @pieces << Bishop.new('black', 6)
    @pieces << King.new('black', 5)
    @pieces << Queen.new('black', 4)
    @pieces << Bishop.new('black', 3)
    @pieces << Knight.new('black', 2)
    @pieces << Rook.new('black', 1)
  end

end
