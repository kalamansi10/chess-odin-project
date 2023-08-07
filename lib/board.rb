class Board
  attr_accessor :dp, :board

  def initialize
    empty_board
  end

  def move_piece(tile, next_tile)
    @dp[next_tile] = @dp[tile]
    @dp[tile] = '   '
  end

  def update_board_display(player)
    player.pieces.each do |piece|
      @dp[piece.tile] = piece.symbol
    end
  end

  def highlight_move_list(piece)
    orig = dp.dup
    @dp[piece.tile] = "#{rd(piece.symbol)}"
    piece.move_list.each do |move|
      @dp[move] = "#{rd(@dp[move])}" if dp[move] != '   '
      @dp[move] = "#{rd(' ⋅ ')}" if dp[move] == '   '
    end
    display_board(piece.color)
    @dp = orig
  end

  def display_board(color = nil)
    case color
    when 'white'
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
    when 'black'
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

  def wt(string) # white_txt_bg
    "\e[47m#{string}\e[0m"
  end

  def gr(string) # green_txt_bg
    "\e[42m#{string}\e[0m"
  end

  def rd(string) # red_txt
    "\e[31m#{string}\e[0m"
  end

  def pp(string) # purple_txt
    "\e[34m#{string}\e[0m"
  end
end
