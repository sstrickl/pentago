class Pentago
	
	# initialize the 4 boards as 1 6x6 matrix 
	def initialize 
		@board= [["u", "u", "u", "u", "u", "u"],	# board 1, 2, 3, 4
				  	
			  	["u", "u", "u", "u", "u", "u"],
				  	
			  	["u", "u", "u", "u", "u", "u"],
				  	
			  	["u", "u", "u", "u", "u", "u"],

			  	["u", "u", "u", "u", "u", "u"],

			  	["u", "u", "u", "u", "u", "u"], ] 
					
		@p_turn = "2"
	end


	# this method takes @board and displays it as 4 separate boards A, B, C, & D
	def printBoards
		# put some space at the top of the boards
		puts
		puts
		# get the numbers to line up correctly #
		print "     " 
		
		for r in 0..5
			# if r = 3 provide extra space between the boards #
			if r == 0
				puts "       ~A~              ~B~"
				print"      "
			end

			if r == 3
				print "     "
			end
		# print the column numbers #
		print "   #{r}"
		end

		# create some space between the column numbers and the board #
		puts ""
		print "   "
		# create top-most border
		print "     ___________      ___________" 
		

		for r in 0..5
			puts  ""  
			puts "        ___________      ___________"  # border for top of each row

			print "   "
  
			
			if r == 3
				puts ""
				puts "            ~C~              ~D~   "
				puts "        -----------      -----------" # bottom border for board A & B #
				print "   "
						
			end

			print " #{r}  | "

			for c in 0..5
				if c == 0
					
				end
				print @board[r][c] + " "
				print "| " # print the border after each element
				
				if c == 2
					print "   | " # if at column 2 add extra space before the next board
				elsif c == 5
					
				end
			end
		end

		puts
		puts "        -----------      -----------"   # bottom border for boards C & D
		puts # add space after the game
		puts 
	end
	
	# each time player turn is called, the opposing player is set as current player.
	def player_Turn

		if @p_turn == "2"
			@p_turn = "1"

			elsif @p_turn == "1"
			 @p_turn = "2"
		end
	end

	# the current player places a "marble" in an xy coordinate starting with player 1.
	def place(x_axis, y_axis)
		x = x_axis
		y = y_axis
		count = 0

		# if a player tries to place in an occupied space don't accept
		if @board[x][y] == '1' || @board[x][y] == '2'
			puts
			print "******* You must choose an unoccupied coordinate *******"
		  # if a player places in an unoccupied space accept
		  elsif @board[x][y] == 'u'
			player_Turn
			@board[x][y] = @p_turn
			count+=1
		end

		if count == 36
			puts
			puts "Cat's game! But you can always play again."
			initialize
		end
		
		# print the boards with the new placement
		printBoards
		# check for a winner

		# need to to check if there is a winner before and after the boards are turned
		
		# if there is not a winner after the placement, tell player to turn a board
		# this is not currently working like I would expect it to.
		if check_win != "Player 1" &&  check_win != "Player 2" 
			puts "Player #{@p_turn} must choose a board to turn and a direction (left or right)."
		end

		#check to see if there is a winner again 
		check_win
	end

	def check_win
		# if there is a winner, print who the winner is and reset the boards
		checkForWin = win
		if checkForWin == "Player 1" or checkForWin == "Player 2"
			puts
			puts "#{checkForWin} is the winner!!"
			initialize
		end
	end

	# turn board A either left or right
	def turn_board_A(direction) 
		# the coordinates which board A overlaps with in @board are indicated in matrix newBoard_A
		newBoard_A = [["0,0","0,1","0,2"],
					  ["1,0","1,1","1,2"],
					  ["2,0","2,1","2,2"]]

		# turn right board A right
		if direction == "right"
			
			for r in 0..2 #r = row
				for c in 0..2  # c = column	
					newBoard_A[r][c] = @board[(3-1)-c][r] 
				end
			end

			for r in 0..2
				for c in 0..2
					@board[r][c] = newBoard_A[r][c]
				end
			end
		end

		# turn board A left
		if direction == "left"
			for r in 0..2
				for c in 0..2
					newBoard_A[r][c] = @board[c][(3-1)-r]
				end
			end


			for r in 0..2
				for c in 0..2
					@board[r][c] = newBoard_A[r][c]
				end
			end
			# call check for win after the turn is complete
		end 

		printBoards
	end

	# turn board B either left or right
	def turn_board_B(direction)
		# the coordinates which board B overlaps with in @board are indicated in matrix newBoard_B
		newBoard_B = [["0,3", "0,4", "0,5"],
				  ["1,3", "1,4", "1,5"],
				  ["2,3", "2,4", "2,5"]]

		# if the user chooses to turn board B right
		if direction == "right"
			for r in 0..2
				for c in 0..2
					newBoard_B[r][c] = @board[(3-1)-c][3+r]
				end
			end

			for r in 0..2
				for c in 3..5
					@board[r][c] = newBoard_B[r][c-3]
				end
			end
		end

		# if the user chooses to turn board B left: 
		if direction == "left"
			for r in 0..2
				for c in 0..2
					newBoard_B[r][c] = @board[c][(6-1)-r]
				end
			end

			for r in 0..2
				for c in 3..5
					@board[r][c] = newBoard_B[r][c-3]
				end
			end
		end
		printBoards 
	end

	# turn board C either left or right
	def turn_board_C(direction)

		newBoard_C=[["3,0", "3,1", "3,2"],
					["4,0", "4,1", "4,2"],
					["5,0", "5,1", "5,2"]]

		if direction == "right"
			for r in 0..2
				for c in 0..2
					newBoard_C[r][c] = @board[5-c][r]
				end
			end

			for r in 0..2
				for c in 0..2
					@board[r+3][c] = newBoard_C[r][c]
				end
			end
		end

		if direction == "left"
			for r in 0..2
				for c in 0..2
					newBoard_C[r][c] = @board[c+3][(3-1)-r]
				end
			end

			for r in 0..2
				for c in 0..2
					@board[r+3][c] = newBoard_C[r][c]
				end
			end
		end 
	printBoards
	end

	# turn board D either left or right
	def turn_board_D(direction)
		newBoard_D = [["","",""],
					  ["","",""],
					  ["","",""],]

		if direction == "right"
			for r in 0..2
				for c in 0..2
					newBoard_D[r][c] = @board[(6-1)-c][r+3]
				end
			end
		

			for r in 0..2
				for c in 0..2
					@board[r+3][c+3] = newBoard_D[r][c]
				end
			end
		end

		if direction == "left"
			for r in 0..2
				for c in 0..2
					newBoard_D[r][c] = @board[c+3][(6-1)-r]
				end
			end

			for r in 0..2
				for c in 0..2
					@board[r+3][c+3] = newBoard_D[r][c]
				end
			end

		end # turn board D either left or right 
	printBoards
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
