require_relative './players/player-white'
require_relative './players/player-black'
require_relative 'board'
require_relative 'display'

class Main
  attr_accessor :board, :white, :black, :current_player

  def initialize
    @board = Board.new
    @white = WhitePlayer.new('john')
    @black = BlackPlayer.new('peter')
    @current_player = @white
    initial_setup
  end

  def initial_setup
    update_board(white)
    update_board(black)
  end

  def update_board(player)
    player.pieces.each do |piece|
      @board.dp[piece.tile] = piece.symbol
      @board.board[piece.tile] = piece
    end
  end

end
