require_relative './players/player-white'
require_relative './players/player-black'
require_relative './pieces/pieces'
require_relative 'board'
require_relative 'miscellaneous'

class Main
  attr_accessor :board, :pieces, :white, :black, :inplay

  def initialize
    @board = Board.new
    @pieces = Pieces.new
    @white = PlayerWhite.new
    @black = PlayerBlack.new
    @inplay = @white
    @waiting = @black
  end

  def play
    update_state
    board.display_board
    display_game_start
    #set_name
    game_loop
  end

  def game_loop
    loop do
      movable_pieces = inplay.get_movable_pieces
      break if movable_pieces.empty?
      tile = select_piece(movable_pieces)
      next_tile = select_destination(tile)
      move_piece(tile, next_tile)
      update_state
      switch_player
    end
    game_over
  end

  private

  include Miscellaneous

  def move_piece(tile, next_tile)
    @waiting.pieces = @waiting.pieces - [pieces.get_piece(next_tile)] if pieces.is_occupied?(next_tile)
    pieces.move_piece(tile, next_tile)
    board.move_piece(tile, next_tile)
  end

  def select_piece(movable_pieces)
    board.display_board(inplay.color)
    display_pick_piece(inplay.name, movable_pieces)
    check_notation(inplay.get_movable_pieces_tiles)
  end

  def game_over
    board.dp[inplay.pieces[0].tile] = "\e[31m#{inplay.pieces[0].symbol}\e[0m"
    board.display_board(inplay.color)
    print "\nCHECKMATE\n\n"
  end

  def select_destination(tile)
    board.highlight_move_list(pieces.get_piece(tile))
    display_pick_destination(inplay.name, pieces.get_piece(tile).move_list)
    check_notation(pieces.get_piece(tile).move_list)
  end

  def update_state
    pieces.update_placements(white)
    pieces.update_placements(black)
    board.update_board_display(white)
    board.update_board_display(black)
    white.update_move_list
    black.update_move_list
  end

  def set_name
    board.display_board(inplay.color)
    display_get_name('white')
    white.name = check_input
    board.display_board(inplay.color)
    display_get_name('black')
    black.name = check_input
  end

  def switch_player
    res = @inplay
    @inplay = @waiting
    @waiting = res
  end

  def check_input
    loop do
      input = gets.chomp
      return input if input.length > 0 && input.length < 10
      board.display_board(inplay.color)
      display_invalid_input
    end
  end

  def check_notation(tiles)
    tiles_notation = get_notations(tiles)
    loop do
      input = gets.chomp.downcase
      return notations_array(input) if tiles_notation.any?(input)
      board.display_board(inplay.color)
      display_invalid_input
    end
  end
end
