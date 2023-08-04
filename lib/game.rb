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

piece = King.new('white', 35)
enemy = Queen.new('black', 36)
piece.next_moves = piece.legal_moves
enemy.next_moves = enemy.legal_moves

piece.next_moves.each do |move|
  game.board.dp[piece.tile] = "\e[31m#{piece.symbol}\e[0m"
  game.board.dp[move] = "\e[31m#{game.board.dp[move]}\e[0m" if game.board.dp[move] != '   '
  game.board.dp[move] = "\e[31m#{' ⋅ '}\e[0m" if game.board.dp[move] == '   '
end
game.board.display_board_wpov
p piece.is_checked?



# counter = 0
# loop do
#   gets
#   save = game.board.dp.dup
#   piece = game.white.pieces[counter]
#   piece.next_moves.each do |move|
#     game.board.dp[piece.tile] = "\e[31m#{piece.symbol}\e[0m"
#     game.board.dp[move] = "\e[31m#{game.board.dp[move]}\e[0m" if game.board.dp[move] != '   '
#     game.board.dp[move] = "\e[31m#{' ⋅ '}\e[0m" if game.board.dp[move] == '   '
#   end
#   game.board.display_board_wpov
#   game.board.dp = save
#   counter += 1
# end


