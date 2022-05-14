.data
promt: .asciiz "Enter a number\n"

.text
main:
	# promt user for input
	la $a0, promt
	li $v0, 4
	syscall
	
	# read input
	li $v0, 5
	syscall
	move $t0, $v0

	# add 1 to num
	addi $t0, $t0, 1
	
	# print num
	move $a0, $t0
	li $v0, 1
	syscall
	
	# exit
	li $v0, 10
	syscall