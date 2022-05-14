.data
	myArray: .space 36
	prompt1: .asciiz "Enter 10 integers: \n"
	prompt2: .asciiz "The sum is: "
.text
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#input 10 integers
	
	la $t0, myArray
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, ($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 4($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 8($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 12($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 16($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 20($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 24($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 28($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 32($t0)
	
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 36($t0)
	
	#sum 10 inttegers
	lw $t1, ($t0)
	lw $t2, 4($t0)
	
	add $t1, $t1, $t2
	
	lw $t2, 8($t0)
	add $t1, $t1, $t2
	
	lw $t2, 12($t0)
	add $t1, $t1, $t2
	
	lw $t2, 16($t0)
	add $t1, $t1, $t2
	
	lw $t2, 20($t0)
	add $t1, $t1, $t2
	
	lw $t2, 24($t0)
	add $t1, $t1, $t2
	
	lw $t2, 28($t0)
	add $t1, $t1, $t2
	lw $t2, 32($t0)
	add $t1, $t1, $t2
	
	lw $t2, 36($t0)
	add $t1, $t1, $t2
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	
