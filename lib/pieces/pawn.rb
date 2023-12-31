require_relative 'pieces'

class Pawn < Pieces
  def initialize(color, tile)
    @piece = 'P'
    @color = color
    @symbol = @color == 'white' ? ' ♙ ' : ' ♟︎ '
    @tile = tile
    @move_list = []
    @status = 'unmoved'
  end

  def legal_moves
    result = []
    case color
    when 'white'
      result << next_tile([2, 0]) if @status == 'unmoved' && @@placements[next_tile([1, 0])].nil?
      result << next_tile([1, -1]) unless is_invalid?([1, -1])
      result << next_tile([1, 1]) unless is_invalid?([1, 1])
      result << next_tile([1, 0]) if @@placements[next_tile([1, 0])].nil?
    when 'black'
      result << next_tile([-2, 0]) if @status == 'unmoved' && @@placements[next_tile([-1, 0])].nil?
      result << next_tile([-1, -1]) unless is_invalid?([-1, -1])
      result << next_tile([-1, 1]) unless is_invalid?([-1, 1])
      result << next_tile([-1, 0]) if @@placements[next_tile([-1, 0])].nil?
    end
    result
  end

  def next_tile(move)
    next_move = next_move_coord(move)
    coord_array(next_move)
  end

  def is_invalid?(move)
    next_move = next_move_coord(move)
    next_tile = coord_array(next_move)
    is_out_of_bounds?(next_move) || is_ally?(next_tile) || get_piece(next_tile).nil?
  end
end
