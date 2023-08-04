class Board
  attr_accessor :dp, :board

  def initialize
    empty_board
  end

  
  def update_board(player)
    player.pieces.each do |piece|
      @dp[piece.tile] = piece.symbol
    end
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

  def empty_board
    @dp = [nil,
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
          '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']
  
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
