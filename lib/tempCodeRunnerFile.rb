counter = 0
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