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

		
