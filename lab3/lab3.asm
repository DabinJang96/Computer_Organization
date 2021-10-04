############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	# declare a zero terminate string
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0	# string with carriage return and line feed
InLenW:	.word   4       # initialize to number of words in input1 and input2
InLenB:	.word   16      # initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	.word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	
#Code for Item 2
#Count number of occurences of letter "l" in Hello string


	li	$t0, 0		# load 0 into the register to count the occurrences of l
	li	$t1, 'd'	# load 'd' into the register to check the end of the string
	li	$t2, 'l' 	# load 'l' into the register to check the exact occurrences of l
part2:
	lb	$s0, 0($a0)		# load the byte of $a0 into $s0
	beq	$s0, $t1, quit2		# condition to finish the loop
	bne	$s0, $t2, part2a	# If $s0 = 'l' then move to loop called part2a
	addi	$t0, $t0, 1		# add 1 to the $t0 register whenever there is 'l'
	j	part2a
part2a:
	addi	$a0, $a0, 1	# counter is added by 1 to check the next byte
	j	part2		
quit2:
	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	li	$v0, 1		# system call code for print_int
	move	$a0, $t0	# copy the total number that's counted into $a0
	syscall

################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 0 and less than AnInt
#

	la	$a0,Enter	# address of string to print
	li	$v0,4		# system call code for print_str
        syscall                 # print the string


	li	$a1, 11		# load word 12 into the register $a1
	li	$a2, 0		# load 0 into the register $a2 

part3:
	bgt	$a2, $a1, quit3	# condition to finish the loop
	li 	$v0, 1		# system call code for print_int
	move 	$a0, $a2	# copy the content of $a1 into $a0
	syscall
	addi	$a2, $a2, 1	# add 1 in order to write the next value
	j	part3
quit3:
	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string


###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input1 (with spaces)
#

	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	move	$t0, $zero	#clears register to 0
	move 	$t1, $zero	#clears	register to 0
	move	$t2, $zero	#clears register to 0
	lw	$t1, InLenB	# load word into register t1
part4:
	beq	$t0, $t1, quit4 	# condition to finish the loop
	lb	$t2, Input1($t0)	# loads word from input(array) to register t2
	move	$a0, $t2		# copy the content of t2 into register a0 to print out
	li	$v0, 1			# system call code for print_int
	syscall
	j	part4a
part4a:
	add	$t0, $t0, 1	# increment of counter by 4 byte
	li	$v0, 4		# system call code for print_str
	la	$a0, space	# loads address of string to print
	syscall
	j	part4
quit4:
	li	$v0, 4		# system call code for print_str
	la	$a0, Enter	# address of string to print
	syscall
	       

###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#
	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	move 	$t1, $zero	#clears	register to 0
	move	$t2, $zero	#clears register to 0

	li	$s0, 0		# load 0 into register s0 for counter
	lw	$s1, InLenW	# load words into register $s1 for Input2
	la	$s2, Input2	# load the address of Input2 to register $s2
	la	$s3, Copy	# load the address of Copy into $s3
part5:
	beq	$s0, $s1, quit5		# condition to finish the loop
	lw	$t1, 0($s2)		# load content of $s2 into $t1
	sw	$t1, 0($s3)		# store content of $t1 into $s3
	
	move 	$a0, $t1		# copy the content of $t1 into $a0 to print
	li	$v0, 1			# site call code for print_int
	syscall

	addi	$s2, $s2, 4		# Input2 address is added by 4
	addi	$s3, $s3, 4		# Copy address is added by 4
	addi	$s0, $s0, 1		# add one to check the end (counter)

	li	$v0, 4			# system call code for print_str
	la	$a0, space		# loads address of string to print
	syscall
	j	part5
quit5:
	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the minimum, maximum, and integer average of the contents of array Input1
#

	move 	$t0, $zero		#clear register to zero
	move 	$t1, $zero		#clear register to zero
	move 	$t2, $zero		#clears register to zero
	move 	$s0, $zero		#clear register to zero
	move 	$s1, $zero		#clear register to zero
	move 	$s2, $zero		#clears register to zero
	move 	$s3, $zero		#clears register to zero


	lw	$t3, InLenB

part6a:
	beq	$t0, $t3, part6b
	lb	$t1, Input1($t4)	# load Input1 content into $t1
	add	$t2, $t2, $t1		# t2 + t1 => t2
	add	$t0, $t0, 1		# increment of counter
	add	$t4, $t4, 1		# increment of counter
	j	part6a
part6b:
	beq	$s0, $t3, part6c
	lb	$t1, Input1($s1)	# load Input1 content into $t1
	beq	$t1, 0, part6c
	add	$s0, $s0, 1
	add	$s1, $s1, 1
	j	part6b
part6c:
	beq	$t5, $t3, quit6
	lb	$t1, Input1($s2)
	beq	$t1, 15, quit6
	add	$t5, $t5, 1
	add	$s2, $s2, 1
	j	part6c
quit6:
	div	$t4, $t2, $t3		# divide the sum to get the average
	li	$v0, 1			# system call code for print_int
	move	$a0, $t4		# copy the content of $t4 into $a0
	syscall
	li	$v0, 4			# system call code for print_str
	la	$a0, space		# loads address of string to print
	syscall
	li	$v0, 1
	move 	$a0, $s1
	syscall
	li	$v0, 4			# system call code for print_str
	la	$a0, space		# loads address of string to print
	syscall
	li	$v0, 1
	move	$a0, $s2
	syscall
	li	$v0, 4		# system call code for print_str
	la	$a0, Enter	# address of string to print
	syscall
	       


#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 30 integers that are divisible by either 7 and 13 (with comma)
#


	move	$t0, $zero	#clears register to 0
	move 	$t1, $zero	#clears	register to 0

	li 	$t2, 7		# load 7 into register t2
	li 	$t3, 13		# load 13 into register t3

part7a:
	beq	$t0, 141, quit7		# condition to finish the loop
	div	$t1, $t4, $t2		# divide t2 by 7, then load the value into t1
	mfhi	$t5			# remainder of the division
	bgtz	$t5, part7b
	beq	$t5, 0, part7c
part7b:
	div	$t1, $t4, $t3	# divide t2 by 13, then load the value into t1
	mfhi	$t5		# remainder of the division
	la	$a0, 0($t5)	# load the address of the remainder into the register a0 
	beq	$a0, 0, part7c	
	add	$t0, $t0, 1	# increment counter by 1
	add	$t4, $t4, 1	# increment counter by 1
	bgtz 	$a0, part7a
part7c:
	li	$v0, 1		# system call code for print_int
	move	$a0, $t4	# copy the content of t4 into a0 to print
	syscall

	li	$v0, 4		# system call code for print_str
	la	$a0, Comma	# print comma between the integers
	syscall

	add	$t0, $t0, 1	# increment counter by 1
	add	$t4, $t4, 1	# increment counter by 1
	j	part7a
quit7:
	la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string


#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 6 lines with 5 integers with spaces per line
# This must be implemented using a nested loop.
#


    	move    $t0, $zero  	#clears register to 0
    	move    $t1, $zero  	#clears register to 0
    	move    $t2, $zero  	#clears register to 0
    	move    $s0, $zero  	#clears register to 0
    	move    $s1, $zero  	#clears register to 0

    
    	li 	$t3, 30  	#load 141 into the register t1
    	li      $t4, 7   	#load 7 into the register t2
    	li      $t5, 13  	#load 13 into the register t3   
    	li 	$s2, 5   	#load 0 into the register s1

part8d:
	div	$t0, $s2		# divide t0 by 5
	mfhi	$t1			# remainder of the division
	beq	$t1, 0, part8e
part8a:
    	beq     $t0, $t3, quit8     	# condition to finish the loop
    	div     $s0, $t4        	# divide $s0 by 7
    	mfhi    $t1         		# remainder of the division
    	bne	$t1, 0, part8b
	beq	$t1, 0, part8c
    	add     $s0, $s0, 1		# increment of counter
    	j	part8a
part8b:
	div	$s0, $t5 		# divide $s0 by 13
	mfhi	$t1			# remainder of the division
	beq	$t1, 0, part8c
	add	$s0, $s0, 1		# increment of counter
	j	part8a
part8c:
	move	$a0, $s0		# copy the content of $s0 into $a0
	li  	$v0, 1          	# system call code for print_int
   	syscall
    	la   	$a0,Comma   		# loads address of string to print
    	li   	$v0,4      		
    	syscall
	add 	$s0, $s0, 1     	# increment by 1
        add 	$t0, $t0, 1     	# increment counter 
	j	part8d
part8e:
	la   	$a0,Enter   
    	li   	$v0,4      
    	syscall            
    	j	part8a
quit8:	              	


Exit:
	jr $ra