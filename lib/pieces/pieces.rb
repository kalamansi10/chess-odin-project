class Pieces

  attr_reader :piece, :color, :symbol
  attr_accessor :tile, :next_moves, :status

  def initialize
    @@placements = DEFAULT.dup
  end

  def update_placements(player)
    player.pieces.each do |piece|
      @@placements[piece.tile] = piece
    end
  end

  def update_next_moves(player)
    player.pieces.each do |piece|
      piece.next_moves = piece.legal_moves
    end
  end

  def legal_moves
    result = []
    counter = 0
    limit = reach[0].length
    reach = self.reach
    until counter == limit || reach.length == 0
      reach.each do |set|
        move = set[counter]
        next_move = next_move_coord(move)
        next_tile = coord_index(next_move)
        if is_out_of_bounds?(next_move) || is_ally?(next_tile)
          reach -= [set]
        else
          result << next_tile
          reach -= [set] if is_enemy?(next_tile)
        end
      end
      counter += 1
    end
    result
  end

  def next_move_coord(coord)
    [(coord[0] + coord_index[tile][0]), (coord[1] + coord_index[tile][1])]
  end

  def is_out_of_bounds?(coord)
    coord[0] < 1 || coord[0] > 8 || coord[1] < 1 || coord[1] > 8
  end

  def is_enemy?(tile)
    @@placements[tile] == (color == 'white' ? 'black' : 'white')
  end

  def is_empty?(tile)
    @@placements[tile].nil?
  end

  def is_ally?(tile)
    @@placements[tile].color == color unless is_empty?(tile)
  end

  def coord_index(coord = nil)

    coord_list = [nil,
                  [8, 1], [8, 2], [8, 3], [8, 4], [8, 5], [8, 6], [8, 7], [8, 8],
                  [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8],
                  [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8],
                  [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [5, 8],
                  [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8],
                  [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8],
                  [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8],
                  [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8]]

    coord == nil ? coord_list : coord_list.find_index(coord)

  end

  private

  DEFAULT = [nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil]

end