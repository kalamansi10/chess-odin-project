class Board
  attr_accessor :dp, :board

  def initialize
    starting_board
  end

  def board_scan(player)
    player.pieces.each do |piece|
      legal_moves(piece)
    end
  end

  def legal_moves(piece)
    next_moves = []
    reach = piece.reach.dup
    counter = 0
    limit = reach[0].length
    piece_coord = coord_index[piece.tile]
    until counter == limit || reach.length == 0
      reach.each do |set|
        move = set[counter]
        destination = [(move[0] + piece_coord[0]), (move[1] + piece_coord[1])]
        des_tile = coord_index(destination)
        if is_out_of_bounds?(destination)
            reach -= [set]
        else
          if is_occupied?(des_tile)
            next_moves << des_tile
          else
            if is_ally?(des_tile, piece)
              reach -= [set]
            else
              next_moves << des_tile
              reach -= [set]
            end
          end
        end
      end
      counter += 1
    end

    next_moves
  end

  def is_out_of_bounds?(destination)
    destination[0] < 1 || destination[0] > 8 || destination[1] < 1 || destination[1] > 8
  end

  def is_occupied?(des_tile)
    @board[des_tile].nil?
  end

  def is_ally?(des_tile, piece)
    @board[des_tile].color == piece.color
  end

  def coord_index(tile = nil)
    coordinates = [nil,
                  [8, 1], [8, 2], [8, 3], [8, 4], [8, 5], [8, 6], [8, 7], [8, 8],
                  [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8],
                  [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8],
                  [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [5, 8],
                  [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [4, 8],
                  [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8],
                  [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8],
                  [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8]]
    tile == nil ? coordinates : coordinates.find_index(tile)      
  end

  def tile_notation(tile)
    [nil,
    'a8', 'b8', 'c8', 'd8', 'e8', 'f8', 'g8', 'h8',
    'a7', 'b7', 'c7', 'd7', 'e7', 'f7', 'g7', 'h7',
    'a6', 'b6', 'c6', 'd6', 'e6', 'f6', 'g6', 'h6',
    'a5', 'b5', 'c5', 'd5', 'e5', 'f5', 'g5', 'h5',
    'a4', 'b4', 'c4', 'd4', 'e4', 'f4', 'g4', 'h4',
    'a3', 'b3', 'c3', 'd3', 'e3', 'f3', 'g3', 'h3',
    'a2', 'b2', 'c2', 'd2', 'e2', 'f2', 'g2', 'h2',
    'a1', 'b1', 'c1', 'd1', 'e1', 'f1', 'g1', 'h1'][tile]
  end

  def display_board_wpov
    print "


    #{pp('8')} │#{wt(dp[1])}#{gr(dp[2])}#{wt(dp[3])}#{gr(dp[4])}#{wt(dp[5])}#{gr(dp[6])}#{wt(dp[7])}#{gr(dp[8])}
    #{pp('7')} │#{gr(dp[9])}#{wt(dp[10])}#{gr(dp[11])}#{wt(dp[12])}#{gr(dp[13])}#{wt(dp[14])}#{gr(dp[15])}#{wt(dp[16])}
    #{pp('6')} │#{wt(dp[17])}#{gr(dp[18])}#{wt(dp[19])}#{gr(dp[20])}#{wt(dp[21])}#{gr(dp[22])}#{wt(dp[23])}#{gr(dp[24])}
    #{pp('5')} │#{gr(dp[25])}#{wt(dp[26])}#{gr(dp[27])}#{wt(dp[28])}#{gr(dp[29])}#{wt(dp[30])}#{gr(dp[31])}#{wt(dp[32])}
    #{pp('4')} │#{wt(dp[33])}#{gr(dp[34])}#{wt(dp[35])}#{gr(dp[36])}#{wt(dp[37])}#{gr(dp[38])}#{wt(dp[39])}#{gr(dp[40])}
    #{pp('3')} │#{gr(dp[41])}#{wt(dp[42])}#{gr(dp[43])}#{wt(dp[44])}#{gr(dp[45])}#{wt(dp[46])}#{gr(dp[47])}#{wt(dp[48])}
    #{pp('2')} │#{wt(dp[49])}#{gr(dp[50])}#{wt(dp[51])}#{gr(dp[52])}#{wt(dp[53])}#{gr(dp[54])}#{wt(dp[55])}#{gr(dp[56])}
    #{pp('1')} │#{gr(dp[57])}#{wt(dp[58])}#{gr(dp[59])}#{wt(dp[60])}#{gr(dp[61])}#{wt(dp[62])}#{gr(dp[63])}#{wt(dp[64])}

        #{pp('a')}  #{pp('b')}  #{pp('c')}  #{pp('d')}  #{pp('e')}  #{pp('f')}  #{pp('g')}  #{pp('h')}
  "
  end

  def display_board_bpov
    print "


    #{pp('1')} │#{wt(dp[64])}#{gr(dp[63])}#{wt(dp[62])}#{gr(dp[61])}#{wt(dp[60])}#{gr(dp[59])}#{wt(dp[58])}#{gr(dp[57])}
    #{pp('2')} │#{gr(dp[56])}#{wt(dp[55])}#{gr(dp[54])}#{wt(dp[53])}#{gr(dp[52])}#{wt(dp[51])}#{gr(dp[50])}#{wt(dp[49])}
    #{pp('3')} │#{wt(dp[48])}#{gr(dp[47])}#{wt(dp[46])}#{gr(dp[45])}#{wt(dp[44])}#{gr(dp[43])}#{wt(dp[42])}#{gr(dp[41])}
    #{pp('4')} │#{gr(dp[40])}#{wt(dp[39])}#{gr(dp[38])}#{wt(dp[37])}#{gr(dp[36])}#{wt(dp[35])}#{gr(dp[34])}#{wt(dp[33])}
    #{pp('5')} │#{wt(dp[32])}#{gr(dp[31])}#{wt(dp[30])}#{gr(dp[29])}#{wt(dp[28])}#{gr(dp[27])}#{wt(dp[26])}#{gr(dp[25])}
    #{pp('6')} │#{gr(dp[24])}#{wt(dp[23])}#{gr(dp[22])}#{wt(dp[21])}#{gr(dp[20])}#{wt(dp[19])}#{gr(dp[18])}#{wt(dp[17])}
    #{pp('7')} │#{wt(dp[16])}#{gr(dp[15])}#{wt(dp[14])}#{gr(dp[13])}#{wt(dp[12])}#{gr(dp[11])}#{wt(dp[10])}#{gr(dp[9])}
    #{pp('8')} │#{gr(dp[8])}#{wt(dp[7])}#{gr(dp[6])}#{wt(dp[5])}#{gr(dp[4])}#{wt(dp[3])}#{gr(dp[2])}#{wt(dp[1])}

        #{pp('h')}  #{pp('g')}  #{pp('f')}  #{pp('e')}  #{pp('d')}  #{pp('c')}  #{pp('b')}  #{pp('a')}
  "
  end

  def starting_board
    @dp = [nil,
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
      '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']
  @board = [nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil,
            nil, nil, nil, nil, nil, nil, nil, nil]
  end

  private

  def wt(string) #white_txt_bg
    "\e[47m#{string}\e[0m"
  end

  def gr(string) #green_txt_bg
    "\e[42m#{string}\e[0m"
  end

  def pp(string) #purple_txt
    "\e[34m#{string}\e[0m"
  end
          
end
