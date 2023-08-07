require_relative 'pieces'
require_relative 'pawn'
require_relative 'knight'
require_relative 'bishop'
require_relative 'rook'
require_relative 'queen'

class King < Pieces
  def initialize(color, tile)
    @piece = 'K'
    @color = color
    @symbol = @color == 'white' ? ' ♔ ' : ' ♚ '
    @tile = tile
    @move_list = []
    @status = 'unmoved'
  end

  def reach
    result = [[[-1, -1]], [[-1, 0]], [[-1, 1]], [[0, -1]], [[0, 1]], [[1, -1]], [[1, 0]], [[1, 1]]]
  end

  def is_checked?
    ref_pieces = [Pawn.new(color, tile),
                  Knight.new(color, tile),
                  Bishop.new(color, tile),
                  Rook.new(color, tile),
                  Queen.new(color, tile)]
    ref_pieces.each do |piece|
      ref_tiles = piece.legal_moves
      ref_tiles.each do |tile|
        next if get_piece(tile).nil? || is_ally?(tile)
        return true if @@placements[tile].piece == piece.piece
      end
    end
    false
  end
end
