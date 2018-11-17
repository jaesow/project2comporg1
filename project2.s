#x = id number 02865424 so N = 27 + (02865424 % 10) N = 27 + 4 N = 31

.data
	
	inputIsLong:    .asciiz "Input is too long."
	inputIsEmpty:   .asciiz "Input is empty"
	inputFromUser:  .space 500
	inputIsInvalid: .asciiz "Invalid base-N number." #if N i soutside of the parameters 0-9 etc. 
.text
	input_IsLong: 
		la $a0, inputIsLong
		li $v0, 4
		syscall
		j exit

	input_IsEmpty:
		la $a0, inputIsEmpty
		li $v0, 4
		syscall
		j exit

	input_IsInvalid:
		la $a0, inputIsInvalid
		li $v0, 4
		syscall
		j exit
	exit:
		li $v0, 10
		syscall

main: 
	li $v0, 8
	la $a0, inputFromUser
	li $a1, 250
	syscall

delete_FirstCharacter:
	addi $a0, $a0, 1 # adds 1 to register $a0
	j delete_LeftPadding # calls delete left paddding function 

delete_LeftPadding:
	li $t8, 32
	lb $t9, 0($a0)
	beq $t8, $t9, delete_FirstCharacter
	move $t9, $a0
	j inputLength # jump to and run to inputLength function 

inputLength:
	addi $t0, $t0, 0
	addi $t1, $t1, 10
	add $t4, $t4, $a0

iterateThroughLength:
	lb $t2, 0($a0)
	beqz $t2, foundLength
	beq $t2, $t1, foundLength
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j iterateThroughLength


		
