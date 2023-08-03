require_relative 'main'
require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/pawn'
require_relative './pieces/queen'
require_relative './pieces/rook'
require_relative './players/player-white'
require_relative './players/player-black'
require_relative 'board'
require_relative 'display'

game = Main.new
game.board.display_board_wpov
piece = Rook.new('white', 36)

p legal = game.board.legal_moves(piece)

legal.each do |move|
  game.board.dp[piece.tile] = "\e[31m#{piece.symbol}\e[0m"
  game.board.dp[move] = "\e[31m#{game.board.dp[move]}\e[0m" if game.board.dp[move] != '   '
  game.board.dp[move] = "\e[31m#{' ⋅ '}\e[0m" if game.board.dp[move] == '   '
end

loop do
  gets
  game.board.display_board_wpov
  gets
  game.board.display_board_bpov
end
