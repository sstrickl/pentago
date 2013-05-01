class Pentago
	
	# initialize the 4 boards as 1 6x6 matrix 
	def initialize 
		@board = [ 
					
				  ["u", "u", "u", "u", "u", "u"],	# board 1, 2, 3, 4
				  	
				  ["u", "u", "u", "u", "u", "u"],
				  	
				  ["u", "u", "u", "u", "u", "u"],
				  	
				  ["u", "u", "u", "u", "u", "u"],

				  ["u", "u", "u", "u", "u", "u"],

				  ["u", "u", "u", "u", "u", "u"], ]	

		@p_turn = "2"
	end


	# this method takes @board and displays it as 4 separate boards A, B, C & D
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

		player_Turn

		@board[x][y] = @p_turn

		self.printBoards
		# should write something so that 1 board must be turned before next player can go. 
	end

	# check to see if there are 5 in a row diagonally from 0,5 - 4,1
	def winDiag5
		winArray1 = []
		winArray2 = []
		
		for rc in 0..4
				if @board[rc][5-rc] == "1"
					winArray1 << @board[rc][5-rc]
				end
			
				if @board[rc][5-rc] == "2"
					winArray2 << @board[rc][5-rc]
				end
		end

	
		# if win array is less than or = to 4, reset winArray to nothing bc it is not a winner.
			if (winArray1.length <= 4) 
				winArray1 = []
			end
		
			if (winArray2.length <= 4)
				winArray2 = []
			end

		print "winArray2 = #{winArray2} winArray1 = #{winArray1}"
	end

	# check to see if there are 5 in a row diagonally from 1,4 - 5,0
	def winDiag4
		winArray1 = []
		winArray2 = []
		
		for rc in 1..5
				if @board[rc][5-rc] == "1"
					winArray1 << @board[rc][5-rc]
				end
			
				if @board[rc][5-rc] == "2"
					winArray2 << @board[rc][5-rc]
				end
		end

		#print "winArray2 = #{winArray2} winArray1 = #{winArray1}"

			if (winArray1.length <= 4) 
				winArray1 = []
			end
		
			if (winArray2.length <= 4)
				winArray2 = []
			end

		print "winArray2 = #{winArray2} winArray1 = #{winArray1}"
	end

	# check to see if there are 5 in a row diagonally from 1,1 - 5,5
	def winDiag1
		winArray1 = []
		winArray2 = []

		for rc in 1..5
				if @board[rc][rc] == "1"
					winArray1 << @board[rc][rc]
				end

				if @board[rc][rc] == "2"
					winArray2 << @board[rc][rc]
				end
		end

		

		if (winArray1.length <= 4)
			winArray1 = []
		end
		
		if (winArray2.length <= 4)
				winArray2 = []
		end

		print "winArray2 = #{winArray2} winArray1 = #{winArray1}"
	end

	# check to see if there are 5 in a row diagonally from 0,0 - 4,4 
	def winDiag0
		winArray1 = []
		winArray2 = []
		
		for rc in 0..4
				if @board[rc][rc] == "1"
					winArray1 << @board[rc][rc]
				end

				if @board[rc][rc] == "2"
					winArray2 << @board[rc][rc]
				end
		end

		if (winArray1.length <= 4) 
			winArray1 = []
		end
		
		if (winArray2.length <= 4) 
			winArray2 = []
		end
		
		print "winArray2 = #{winArray2} winArray1 = #{winArray1}"	
	end

	# check to see if there are 5 in a row from 0,0 - 0,4 through 5,0 - 5,4
	def winRow0
		winArray1 = []
		winArray2 = []
			for c in 0..5
				if (winArray1.length <= 3) && (winArray2.length <= 3)
					winArray1 = []
					winArray2 = []
					for r in 0..4
						if @board[r][c] == "1"
							winArray1 << @board[r][c]
						end

						if @board[r][c] == "2"
							winArray2 << @board[r][c]
						end
					end
				end
			end

			print "winArray1 = #{winArray1} & winArray2 = #{winArray2}"
	end

	# check to see if there are 5 in a row from 0,1 - 0,5 through 5,1 - 5,5
	def winRow1
		winArray1 = []
		winArray2 = []
			for c in 0..5
				if (winArray1.length <= 3) && (winArray2.length <= 3)
					winArray1 = []
					winArray2 = []
					for r in 1..5
						if @board[r][c] == "1"
							winArray1 << @board[r][c]
						end

						if @board[r][c] == "2"
							winArray2 << @board[r][c]
						end
					end
				end
			end

			print "winArray1 = #{winArray1} & winArray2 = #{winArray2}"
	end 

	# check to see if there are 5 in a row from 0,0 - 4,0 through 0,5 - 4,5  
	def winCol0
		winArray1 = []
		winArray2 = []
				for r in 0..5
					if (winArray1.length <= 3) && (winArray2.length <= 3)
						winArray1 = []
						winArray2 = []
					 	for c in 0..4
							if @board[r][c] == "1" 
								winArray1 << @board[r][c]
							end

							if @board[r][c] == "2"
								winArray2 << @board[r][c] 
							end
						end
					end
				end
			
			print "winArray1 = #{winArray1} winArray2 = #{winArray2}"	  
	end

	# check to see if there is a win starting from 1,0 - 5,0  through 1,5 - 5,5
	def winCol1
		winArray1 = []
		winArray2 = []
				for r in 0..5
					if (winArray1.length <=3) && (winArray2.length <=3)
						winArray1 = []
						winArray2 = []
					 	for c in 1..5
							if @board[r][c] == "1" 
								winArray1 << @board[r][c]
							end

							if @board[r][c] == "2"
								winArray2 << @board[r][c] 
							end
						end
					end
				end
			
			# print "winArray1 = #{winArray1} winArray2 = #{winArray2}"	 
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

end
