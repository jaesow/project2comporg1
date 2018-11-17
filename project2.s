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


foundLength:
	beqz $t0, input_IsEmpty
	slti $t3, $t0, 5
	beqz $t3, input_IsEmpty
	move $a0, $t4
	j reviewString

reviewString:
	lb $t5, 0($a0)
	beqz $t5, prepForConvo
	beq $t5, $t1, prepForConvo
	slti $t6, $t5, 48
	bne $t6, $zero, input_IsInvalid
	slti $t6, $t5, 58
	bne $t6, $zero, moveCharForward
	slti $t6, $t5, 65
	bne $t6, $zero, input_IsInvalid
	slti $t6, $t5, 86                 
	bne $t6, $zero, moveCharForward
	slti $t6, $t5, 97
	bne $t6, $zero, input_IsInvalid	
	slti $t6, $t5, 118 
	bne $t6, $zero, moveCharForward
	bgt $t5, 119, input_IsInvalid   

moveCharForward:
	addi $a0, $a0, 1
	j reviewString

prepForConvo:
	move $a0, $t4
	addi $t7, $t7, 0
	add $s0, $s0, $t0
	addi $s0, $s0, -1	
	li $s3, 3
	li $s2, 2
	li $s1, 1
	li $s5, 0

base_convert_input:
	lb $s4, 0($a0)
	beqz $s4, print
	beq $s4, $t1, print # compares the registries
	slti $t6, $s4, 58
