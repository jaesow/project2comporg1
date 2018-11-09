# project2comporg1
Assume your Howard ID as a decimal integer is X. Let N = 27 + (X % 10) where % is the modulo operation, and M = N – 10.
You will write a MIPS program that reads a string of up to 4 characters from user input.
• If the string has only the characters from '0' to '9' and from 'a' to β and from 'A' to Δ, the program prints out the unsigned decimal integer corresponding to the base-N number in the string. β stands for the M-th lower case letter and Δ stands for the M-th upper case letter in the English alphabet. In a base-N number, both 'a' and 'A' correspond to the decimal integer of 10, both 'b' and 'B' to 11, and so on, both β and Δ correspond to N – 1.
• If the string has more than 4 characters, the program prints the message of "Input is too long."
• If the string has zero characters, the program prints the message of "Input is empty."
• If the string includes at least one character not in the specified set, the program prints the message of "Invalid base-N number." Where N should be replaced by the integer value of N.
