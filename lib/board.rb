class Board
  attr_accessor :board

  def initialize
    @board = @@DEFAULT
  end

  def print_board
    print "
    #{mf('8')} │#{ws(board[1])}#{bs(board[2])}#{ws(board[3])}#{bs(board[4])}#{ws(board[5])}#{bs(board[6])}#{ws(board[7])}#{bs(board[8])}
    #{mf('7')} │#{bs(board[9])}#{ws(board[10])}#{bs(board[11])}#{ws(board[12])}#{bs(board[13])}#{ws(board[14])}#{bs(board[15])}#{ws(board[16])}
    #{mf('6')} │#{ws(board[17])}#{bs(board[18])}#{ws(board[19])}#{bs(board[20])}#{ws(board[21])}#{bs(board[22])}#{ws(board[23])}#{bs(board[24])}
    #{mf('5')} │#{bs(board[25])}#{ws(board[26])}#{bs(board[27])}#{ws(board[28])}#{bs(board[29])}#{ws(board[30])}#{bs(board[31])}#{ws(board[32])}
    #{mf('4')} │#{ws(board[33])}#{bs(board[34])}#{ws(board[35])}#{bs(board[36])}#{ws(board[37])}#{bs(board[38])}#{ws(board[39])}#{bs(board[40])}
    #{mf('3')} │#{bs(board[41])}#{ws(board[42])}#{bs(board[43])}#{ws(board[44])}#{bs(board[45])}#{ws(board[46])}#{bs(board[47])}#{ws(board[48])}
    #{mf('2')} │#{ws(board[49])}#{bs(board[50])}#{ws(board[51])}#{bs(board[52])}#{ws(board[53])}#{bs(board[54])}#{ws(board[55])}#{bs(board[56])}
    #{mf('1')} │#{bs(board[57])}#{ws(board[58])}#{bs(board[59])}#{ws(board[60])}#{bs(board[61])}#{ws(board[62])}#{bs(board[63])}#{ws(board[64])}

        #{mf('a')}  #{mf('b')}  #{mf('c')}  #{mf('d')}  #{mf('e')}  #{mf('f')}  #{mf('g')}  #{mf('h')}
  "
  end

  private

  def ws(string)
    "\e[47m#{string}\e[0m"
  end

  def bs(string)
    "\e[42m#{string}\e[0m"
  end

  def mf(string)
    "\e[34m#{string}\e[0m"
  end

  @@DEFAULT = [nil,
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ',
              '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']

  @@COORDINATES = [nil,
                'a8', 'b8', 'c8', 'd8', 'e8', 'f8', 'g8', 'h8',
                'a7', 'b7', 'c7', 'd7', 'e7', 'f7', 'g7', 'h7',
                'a6', 'b6', 'c6', 'd6', 'e6', 'f6', 'g6', 'h6',
                'a5', 'b5', 'c5', 'd5', 'e5', 'f5', 'g5', 'h5',
                'a4', 'b4', 'c4', 'd4', 'e4', 'f4', 'g4', 'h4',
                'a3', 'b3', 'c3', 'd3', 'e3', 'f3', 'g3', 'h3',
                'a2', 'b2', 'c2', 'd2', 'e2', 'f2', 'g2', 'h2',
                'a1', 'b1', 'c1', 'd1', 'e1', 'f1', 'g1', 'h1']
                
  @@REF = [nil,
          ' 1', ' 2', ' 3', ' 4', ' 5', ' 6', ' 7', ' 8',
          ' 9', '10', '11', '12', '13', '14', '15', '16',
          '17', '18', '19', '20', '21', '22', '23', '24',
          '25', '26', '27', '28', '29', '30', '31', '32',
          '33', '34', '35', '36', '37', '38', '39', '40',
          '41', '42', '43', '44', '45', '46', '47', '48',
          '49', '50', '51', '52', '53', '54', '55', '56',
          '57', '58', '59', '60', '61', '62', '63', '64']  

  
end
