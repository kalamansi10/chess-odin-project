require_relative './players/player-white'
require_relative './players/player-black'
require_relative './pieces/pieces'
require_relative 'board'
require_relative 'display'

class Main
  attr_accessor :board, :pieces, :white, :black, :current_player, :order

  def initialize
    @board = Board.new
    @pieces = Pieces.new
    @white = WhitePlayer.new('john')
    @black = BlackPlayer.new('peter')
    @order = [@white, @black]
    update_game
  end

  def update_game
    @order.each do |player|
      board.update_board(player)
      pieces.update_placements(player)
      pieces.update_next_moves(player)
    end
  end

  def switch_player
    @order = [@order[1], @order[0]]
  end

  

end
