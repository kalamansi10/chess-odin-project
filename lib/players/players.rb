require_relative '../pieces/bishop'
require_relative '../pieces/king'
require_relative '../pieces/knight'
require_relative '../pieces/pawn'
require_relative '../pieces/queen'
require_relative '../pieces/rook'

class Players
  attr_accessor :name, :pieces, :color

  def get_movable_pieces
    result = []
    pieces.each do |piece|
      result << piece unless piece.move_list.empty?
    end
    result
  end

  def get_movable_pieces_tiles
    result = []
    pieces.each do |piece|
      result << piece.tile unless piece.move_list.empty?
    end
    result
  end

  def update_move_list
    pieces.each do |piece|
      result = []
      move_list = piece.legal_moves
      unless move_list.empty?
        move_list.each do |move|
          result << move unless piece.is_bad_move?(piece.tile, move, self)
        end
      end
      piece.move_list = result
    end
  end

  def is_checked?
    pieces[0].is_checked?
  end

end
