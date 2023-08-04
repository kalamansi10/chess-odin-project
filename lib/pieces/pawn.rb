require_relative 'pieces'

class Pawn < Pieces
  
  def initialize(color, tile)
    @piece = 'knight'
    @color = color
    @symbol = @color == 'white' ? ' ♙ ' : ' ♟︎ '
    @tile = tile
    @next_moves = []
    @status = 'unmoved'
  end

  def legal_moves
    case color
    when 'white'
      next_moves << next_tile([2,0]) if @status == 'unmoved' && @@placements[next_tile([1,0])].nil?
      add_move([1,-1])
      add_move([1,1])
      next_moves << next_tile([1,0]) if @@placements[next_tile([1,0])].nil?
    when 'black'
      next_moves << next_tile([-2,0]) if @status == 'unmoved' && @@placements[next_tile([-1,0])].nil?
      add_move([-1,-1])
      add_move([-1,1])
      next_moves << next_tile([-1,0]) if @@placements[next_tile([-1,0])].nil?
    end
  end

  def next_tile(move)
    next_move = next_move_coord(move)
    coord_index(next_move)
  end

  def add_move(move)
    next_move = next_move_coord(move)
    next_tile = coord_index(next_move)
    next_moves << next_tile unless is_out_of_bounds?(next_move) || is_ally?(next_tile) || @@placements[next_tile].nil?
  end

end
