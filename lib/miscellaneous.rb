module Miscellaneous
  def display_confirmation
    print "
    [#{pp('ENTER')}] to to continue.


    "
    gets
  end

  def display_game_start
    print "\n\n\n\n\n\n\n\n\n\n
    [#{pp('ENTER')}] to start game.


    "
    gets
  end

  def display_get_name(color)
    print "
    Type #{pp("player-#{color}")} name.


    "
  end

  def display_pick_piece(name, pieces)
    print "
    #{pp(name)}, select a piece to move.
    #{get_pieces_info_str(pieces)}

    "
  end

  def display_pick_destination(name, move_list)
    print "
    #{pp(name)}, select a tile to move to.
    #{get_move_list_str(move_list)}

    "
  end

  def display_invalid_input
    print "
    Invalid input.


    "
  end


  def get_pieces_info_str(pieces)
    result = ''
    pieces.each do |piece|
      next if piece.status == 'dead'
      result += "[#{pp("#{notations_array[piece.tile]}-#{piece.piece}")}] "
    end
    result
  end

  def get_move_list_str(move_list)
    result = ''
    move_list.each do |tile|
      result += "[#{pp(notations_array[tile])}] "
    end
    result
  end

  def get_notations(tiles)
    result = []
    tiles.each do |tile|
      result << notations_array[tile]
    end
    result
  end

  def notations_array(notation = nil)
    notations = [nil,
                 'a8', 'b8', 'c8', 'd8', 'e8', 'f8', 'g8', 'h8',
                 'a7', 'b7', 'c7', 'd7', 'e7', 'f7', 'g7', 'h7',
                 'a6', 'b6', 'c6', 'd6', 'e6', 'f6', 'g6', 'h6',
                 'a5', 'b5', 'c5', 'd5', 'e5', 'f5', 'g5', 'h5',
                 'a4', 'b4', 'c4', 'd4', 'e4', 'f4', 'g4', 'h4',
                 'a3', 'b3', 'c3', 'd3', 'e3', 'f3', 'g3', 'h3',
                 'a2', 'b2', 'c2', 'd2', 'e2', 'f2', 'g2', 'h2',
                 'a1', 'b1', 'c1', 'd1', 'e1', 'f1', 'g1', 'h1']

    notation.nil? ? notations : notations.find_index(notation)
  end

  def pp(string) # purple_txt
    "\e[34m#{string}\e[0m"
  end

end
