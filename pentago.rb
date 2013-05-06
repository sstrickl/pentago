class Pentago
	
	# initialize the 4 boards as 1 6x6 matrix 
	def initialize 
		@board= [[" ", " ", " ", " ", " ", " "],	# board 1, 2, 3, 4
				  	
			  	[" ", " ", " ", " ", " ", " "],
				  	
			  	[" ", " ", " ", " ", " ", " "],
				  	
			  	[" ", " ", " ", " ", " ", " "],

			  	[" ", " ", " ", " ", " ", " "],

			  	[" ", " ", " ", " ", " ", " "],]

		@p_turn = "1"
		@count = 0
	end

	# this method takes @board and displays it as 4 separate boards A, B, C, & D
	def print_board
		# put some space at the top of the boards
		puts
		puts

		# print top line
		puts "             ~A~                  ~B~"
		
		# print the column numbers
		for c in 0..5
			# if c = 0 provide extra space to start the line
			if c == 0
				print "       "
			end
	
			# if c = 3 provide extra space between the boards #
			if c == 3
				print "         "
			end
		
			# print the column number
			print "   #{c+1}"
		end

		# print each row
		for r in 0..5

			puts "\n        _____________        _____________" 
			print "   "
			
			if r == 3
				puts "\n             ~C~                  ~D~"
				puts "        _____________        _____________" 

				#puts "        ----------        ----------" # bottom border for board A & B #
				print "   "
			end

			# print row number
			print " #{r+1}   |"

			# print each element on the board
			for c in 0..5
				print " #{@board[r][c]} |" # print element and border
				
				if c == 2
					print "        |" # if at column 2 add extra space before the next board
				end
			end
		end

		# print bottom border
		puts "\n        _____________        _____________" 
	end

	# return which player's turn it is
	def get_player_turn
		return "Player #{@p_turn}"
	end

	# each time player turn is called, the opposing player is set as current player.
	def switch_player_turn
		if @p_turn == "2"
			@p_turn = "1"

		elsif @p_turn == "1"
			@p_turn = "2"
		end
	end

	# current player places a marble
	def place_marble(row, col)

		# if a player placed in an unoccupied space, return true indicating accepted
		if ' ' == @board[row][col]
			@board[row][col] = @p_turn
			@count += 1
			return true

		# player tried to place in an occupied space, return false indicating rejected
		else
			return false
		end
	end

	# turn a board either left or right
	def turn_board(boardChar, direction)
		case boardChar
			when 'A'
				puts "turning A"
				turn_board_helper(direction, 0, 0)
			when 'B'
				puts "turning B"
				turn_board_helper(direction, 0, 3)
			when 'C'
				puts "turning C"
				turn_board_helper(direction, 3, 0)
			when 'D'
				puts "turning D"
				turn_board_helper(direction, 3, 3)
		end
	end

	# turn a 3x3 submatrix either left or right
	# does not check if coordinates in range
	def turn_board_helper(direction, startRow, startCol)
		tempBoard = [["","",""],
					 ["","",""],
					 ["","",""],]

		# turn the board either left or right
		if "right" == direction
			for r in 0..2
				for c in 0..2
					tempBoard[r][c] = @board[startRow+2-c][startCol+r]
				end
			end
		elsif "left" == direction
			for r in 0..2
				for c in 0..2
					tempBoard[r][c] = @board[startRow+c][startCol+2-r]
				end
			end
		end

		# copy the temporary board to the game board
		for r in 0..2
			for c in 0..2
				@board[startRow+r][startCol+c] = tempBoard[r][c]
			end
		end
	end

	def get_winner
		winner = win
		
		if 36 == '@count' && "" == winner
			winner = 'Draw'
		
		elsif "" == winner
			winner = 'None'
		end

		return winner
	end

	# check to see if there are 5 in a row diagnally from any corner, from any column or any row
	def win
		winRowArray = []
		winColArray = []
		winDiagArrayL = []
		winDiagArrayR = []
		winner = "" # p1 or p2
		for r in 0..5
			# create the arrays containing the diagonal elements
			winDiagArrayL << @board[r][r]
			winDiagArrayR << @board[r][5-r]
		
			# if r is 4 or 5 check to see if there is a winner
			if r == 4 || r == 5
				# if there are 5 1's in a row 1 is the winner diagonally
				if /1{5}/.match(winDiagArrayL.join) || /1{5}/.match(winDiagArrayR.join)
					winner = "Player 1"
					
				elsif /2{5}/.match(winDiagArrayL.join) || /2{5}/.match(winDiagArrayR.join)
					winner = "Player 2"
				else
					# if there is not a winner pop the first item off in order to check with the 5th element
				 	winDiagArrayL.shift
				 	winDiagArrayR.shift
				end
			end

			for c in 0..5
				# create the array containing the row elements
				winRowArray << @board[r][c]
				# create the array containing the column elements
				winColArray << @board[c][r]

				# when c is for check for a winner bc the arrays are filled with 5 elements
				if c == 4
					if /1{5}/.match(winRowArray.join) || /1{5}/.match(winColArray.join)
						winner = "Player 1"
					elsif /2{5}/.match(winRowArray.join) || /2{5}/.match(winColArray.join) 
						winner = "Player 2"
					else
					# if there is not a winner pop the first item of each array off in order to check with the 5th element
						winRowArray.shift
						winColArray.shift
					end
				end

				# check for a winner with the 5th element in place
				if c == 5
					if /1{5}/.match(winRowArray.join) || /1{5}/.match(winColArray.join)
						winner = "Player 1"
					elsif /2{5}/.match(winRowArray.join) || /2{5}/.match(winColArray.join) 
						winner = "Player 2"
					# if there is not a winner, reset each array to empty
					else	
						winRowArray=[]
						winColArray=[]
					end 
				end
			end # end nested for	
		end # end larger for
		
		# return winner var
		winner
	end

end
