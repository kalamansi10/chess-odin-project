require_relative 'white-player'
require_relative 'black-player'
require_relative 'board'

class Main
  attr_accessor :board, :white, :black, :current_player
  def initialize
    @board = Board.new
    @white = WhitePlayer.new('john')
    @black = BlackPlayer.new('peter')
    @current_player = @white
    set_pieces
  end

  

  def set_pieces
    white.pieces.each do |piece|
      @board.board[piece.position] = piece.symbol
    end
    black.pieces.each do |piece|
      @board.board[piece.position] = piece.symbol
    end
  end

end
