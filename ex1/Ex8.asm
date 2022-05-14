.data
	prompt1: .asciiz "The array is: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10\n"
	prompt2: .asciiz "Enter the index: "
	prompt3: .asciiz "The value at that index is: " 
	myArray: .word 1,2,3,4,5,6,7,8,9,10
.text
	la $t0, myArray  #load address of array
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $t5, $v0
	
	add $t2, $zero, $t5           
	add $t2, $t2, $t2    # double the index
	add $t2, $t2, $t2    # double the index again (now 4x)
	add $t1, $t0, $t2    # get address of ith location
	lw $t4, 0($t1)
	
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	
	
	
	
