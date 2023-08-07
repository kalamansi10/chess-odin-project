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
    set_name
    game_loop
  end

  def game_loop
    loop do
      movable_pieces = inplay.get_movable_pieces
      break if movable_pieces.empty?
      tile = select_piece(movable_pieces)
      next_tile = select_destination(tile)
      move_piece(tile, next_tile)
      switch_player
      update_state
    end
    game_over
  end

  private

  include Miscellaneous

  def game_over
    board.dp[inplay.pieces[0].tile] = "\e[31m#{inplay.pieces[0].symbol}\e[0m"
    board.display_board(inplay.color)
    print "\nCHECKMATE\n\n"
  end

  def move_piece(tile, next_tile)
    @waiting.pieces = @waiting.pieces - [pieces.get_piece(next_tile)] if pieces.is_occupied?(next_tile)
    is_pawn_upgradable?(tile, next_tile) if pieces.get_piece(tile).piece == 'P'
    pieces.move_piece(tile, next_tile)
    board.move_piece(tile, next_tile)
  end

  def upgrade_pawn(tile, pawn)
    @inplay.pieces = @inplay.pieces - [pawn]
    board.display_board(inplay.color)
    display_pick_upgrade(inplay.name)
    @inplay.pieces << @inplay.upgrade_pawn(tile, check_upgrade)
  end

  def is_pawn_upgradable?(tile, next_tile)
    pawn = pieces.get_piece(tile)
    upgrade_pawn(next_tile, pawn) if next_tile < 9 || next_tile > 56
  end

  def select_piece(movable_pieces)
    board.display_board(inplay.color)
    display_pick_piece(inplay.name, movable_pieces)
    check_notation(inplay.get_movable_pieces_tiles)
  end

  def select_destination(tile)
    selected_piece = pieces.get_piece(tile)
    castle_moves = add_castling(selected_piece) if is_castleable?(selected_piece)
    board.highlight_move_list(pieces.get_piece(tile))
    display_pick_destination(inplay.name, selected_piece.move_list)
    result = check_notation(pieces.get_piece(tile).move_list)
    castle(result, selected_piece) if is_castleable?(selected_piece) && castle_moves.any?(result)
    result
  end

  def is_castleable?(piece)
    piece.piece == 'K' && piece.status == 'unmoved'
  end

  def add_castling(piece)
    cn = piece.tile - 2
    cp = piece.tile + 2
    piece.move_list += [cn] if !inplay.pieces[1].nil? && inplay.pieces[1].status == 'unmoved' && inplay.pieces[1].move_list.any?(piece.tile - 1)
    piece.move_list += [cp] if !inplay.pieces[2].nil? && inplay.pieces[2].status == 'unmoved' && inplay.pieces[2].move_list.any?(piece.tile + 1)
    [0, cn, cp]
  end

  def castle(tile, piece)
    if tile < piece.tile
      move_piece(inplay.pieces[1].tile, inplay.pieces[1].tile + 3)
    elsif tile > piece.tile
      move_piece(inplay.pieces[2].tile, inplay.pieces[2].tile - 2)
    end
    board.display_board(inplay.color)
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

  def check_upgrade
    loop do
      input = gets.chomp.upcase
      return input if ['Q', 'N', 'B', 'R'].any?(input)
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
