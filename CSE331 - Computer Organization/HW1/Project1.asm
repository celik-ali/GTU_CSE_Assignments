.data
	# To make i/o control easy I used a 4*4 grid in this code. Since I couldn't finish it I couldn't update to 16*16.
	# Since I couldn't finish the code, in some parts I have explained what I was going to the if I could.
	# For repeated code parts I have given detailed comments for the first ones for readability.
	
	# Strings and variables are below
	Msg1: 		.asciiz  "\nPlease enter your input for 4x4 grid: \n"
	Msg2:		.asciiz  "\nYou have entered\n",
	Msg3:		.asciiz  "First line of your input is: "
	Msg4:		.asciiz  "Please enter the time: "
	newline:	.asciiz	 "\n"
	BGrid: 		.asciiz  "\n0000"
	Timer:		.word		# Integer to store how many seconds user wants.
	String1: 	.space 6 	# Allocating space as large as given number for strings. Since I used 4*4 array in code. I used at most 6 chars.
	String2: 	.space 6
	String3: 	.space 6
	String4: 	.space 6
	Array:		.word String1	#Putting strings into array
				.word String2
				.word String3
				.word String4
	Size:		.word 4		# Since we are going to use 4 by 4 Array Column Size will be 4
	.eqv DATA_SIZE 1 		# This is a constant works same as macro directives(#define ...) in C. It keeps dataSize as seen in its name.
	
	
.text
	Main:	
	#Prints Msg4 into terminal
		li $v0, 4			# According to syscall requirements to be able to print a string $v0 should be 0
		la $a0, Msg4 		# Loading address of what we want to print on the terminal to $a0
		syscall
	####################################################
	#Takes integer input 
		li $v0, 5			# Syscall needs $v0=5 to be able read integer.
		syscall
		sb $v0, Timer		# Using Store Byte we are storing what $v0 has into variable Timer. sw worked at first but then did not worked. I have replaced it with sb.
	####################################################
		j Game # Jumping to game function(subroutine) to handle the project.
		
	Game:	# This function will take given second as arguments. Then it will control the game.
	
	#Prints Msg1 into terminal
		li $v0, 4			# According to syscall requirements to be able to print a string $v0 should be 0
		la $a0, Msg1 		# Loading address of what we want to print on the terminal to $a0
		syscall
	####################################################

	#Reads string input from terminal
		li $v0, 8 			#Because we do not change value of $v0 we do not need to write this line again till it requires change.
		la $a0, String1	#And puts it into StrBuff
		li $a1, 6 			# Because our grid is 4x4, maximum number of characters to read is 6 here. This number needs to be 1 more than need because last character will be '\0'. However, when I tried to take consequnces inputs. It failed then I added one more.
		syscall	
	####################################################

	#Reads string input from terminal
		la $a0, String2		#And puts it into String2
		li $a1, 6 
		syscall	
	####################################################

	#Reads string input from terminal
		la $a0, String3		#And puts it into String3
		li $a1, 6 
		syscall	
	####################################################

	#Reads string input from terminal
		la $a0, String4		#And puts it into String4
		li $a1, 6 
		syscall	
	####################################################

	#Prints Msg2 into terminal
		li $v0, 4			#Because we do not change value of $v0 we do not need to write this line again till it requires change
		la $a0, Msg2
		syscall
	####################################################
	
	#Prints String1 into screen
		la $a0, String1
		syscall
	####################################################
	
	#Prints String2 into screen
		la $a0, String2
		syscall
	####################################################
	
	#Prints String3 into screen
		la $a0, String3
		syscall
	####################################################
	
	#Prints String4 into screen
		la $a0, String4
		syscall
	####################################################
		
	#Prints one row of Array
		la $t9, Array           # Load the base address of the array into $t9 for other operations

	#Prints Msg3 into terminal
		li $v0, 4
		la $a0, Msg3
		syscall
	####################################################
		lw $t1, 0($t9)			# Since I aimed to print first line I am loading 0 offset of Array to $t1
		li $t2, 0				# Since we are going to loop through in array we will need a counter($t2) 
		
	PrintLoop: #This subroutine handles loop for chars to print strings.
		# In for loop I was planning to use row-major order 2D array to reach specific elements
		# This order implements following equation: addr = baseAddr +(rowIndex*colSize + colIndex)*dataSize
		
		lb $t3, 0($t1)			# Using load byte I am loading character at (0,$t1) to t3
		beq $t2, 4, FillGrid	# Controlling our counter whether it reached specified character number or not. In this case it is 4. Since length is 4
		li $v0, 11				# To be able to write a character to terminal via syscall we need to load $v0 with 11
		move $a0, $t3			# Because content of $a0 will be printed we are moving our char($t3) to $a0 
		syscall
		
		addi $t1, $t1, 1		# Incrementing $t1 so that we can move through row
		addi $t2, $t2, 1		# Incrementing $t2(counter) so that loop can end
		
		j PrintLoop				# If code comes here it will loop through PrintLoop function

		
		li $t0, 0				# Since we are going to loop we will need a counter($t0) 
	FillGrid:	# If second is even this function will be called and it will print a grid full of bombs
		
		beq $t0, 4, Exit		# Checks for counter($t0) not equal 4
		li $v0, 4				# Required for syscall
		la $a0, BGrid 			# Prints BGrid line by line with this loop
		syscall
		addi $t0, $t0, 1		# This is the increment place for counter
		j FillGrid				# This is needed for for loop
	####################################################

	Detonate: 	# If second is odd this function will be called and it will handle detonation part.
				# There will be for loop to check older bombs and other places will be filled with 'a'.
				# After that, bombs(3 second olds)' detonation will take place bombs and necessary neighbour places will be replaced with '.'
				# Bombs(2 Second olds) will be placed so that at next detonation they will detonate.
				# 
	####################################################
	
	Exit:	
	#Terminates the program
		li $v0, 10		# For syscall to terminate the program it needs 10 placed in $v0
		syscall
	####################################################
