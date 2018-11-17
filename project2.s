#x = id number 02865424 so N = 27 + (02865424 % 10) N = 27 + 4 N = 31

.data
	
	inputIsLong:    .asciiz "Input is too long."
	inputIsEmpty:   .asciiz "Input is empty"
	inputFromUser:  .space 500
	inputIsInvalid: .asciiz "Invalid base-N number." #if N i soutside of the parameters 0-9 etc. 
