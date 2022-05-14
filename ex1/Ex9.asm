.data
	Input : .asciiz "Input 10 integer array elements:\n"
	Output : .asciiz "\nReverse order: "
	new_line : .asciiz "\n"
	array : .word 0
.text

	main:
	li $v0, 4
	la $a0, Input
	syscall
	li $t0, 0
	la $a0, array


	read_int:
	li $v0, 5
	syscall
	sw $v0, ($a0)
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	bne $t0, 10, read_int
	la $a0, array
	li $t0, 0
	li $s1, 0

	next:
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, Output
	syscall
	li $t0, 0
	la $s1, array+36

	print_int:
	li $v0, 4
	la $a0, new_line
	syscall
	li $v0, 1
	lw $a0, ($s1)
	syscall
	addi $s1, $s1, -4
	addi $t0, $t0, 1
	bne $t0, 10, print_int

	exit:
	li $v0, 10
	syscall
