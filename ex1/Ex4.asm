.data
	prompt1: .asciiz "Enter five integers \n"
	prompt2: .asciiz "Print in reverse: \n"
.text
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#1
	li $v0, 5
	syscall
	move $t0, $v0
	#2
	li $v0, 5
	syscall
	move $t1, $v0
	#3
	li $v0, 5
	syscall
	move $t2, $v0
	#4
	li $v0, 5
	syscall
	move $t3, $v0
	#5
	li $v0, 5
	syscall
	move $t4, $v0
	
	#print
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
