load 'Pentago.rb'

def play_pentago

  pBoard = Pentago.new
  redraw_board = true
  gameOver = false

  # loop until all marbles are placed or there is a winner
  while !gameOver

    # draw the board if neccessary
    if redraw_board
      pBoard.print_board
    else
      redraw_board = true
    end

    # play the turn
    puts pBoard.get_player_turn + " please place a marble: "
    # the input needs to be error checked
    puts "Enter row: "
    # get row number from user
    row = gets.to_i
    break if 'c' == row
    puts "Enter column: "
    # get column number from user
    col = gets.to_i
    break if 'r' == col

    # place the marble in the desired location
    marble_placed = pBoard.place_marble(row, col)
    if (marble_placed)

      # print the board with the newly placed marble
      pBoard.print_board

      # select board to turn
      puts pBoard.get_player_turn + " must choose a board to turn left or right"
      puts "Enter board to turn: "
      board = gets.chomp
      puts "Enter direction (L/R): "
      direction = gets.chomp
      pBoard.turn_board(board, direction)

      # check for winner
      # getWinner returns Draw, None, or player 1 or 2
      winner = pBoard.get_winner
      if "None" == winner
        # no winner, switch player turn and keep going
        pBoard.switch_player_turn
      elsif "Draw" == winner
        # tie game
        pboard.print_board
        puts "Cat's game! But you can always play again."
        gameOver = true
      else
        pBoard.print_board
        puts "Winner is #{winner}. Congratulations #{winner}"
        gameOver = true
      end
    else
      puts "\n*****Please choose an unoccupied space*****"
      redraw_board = false
    end
  end
end

play_pentago
