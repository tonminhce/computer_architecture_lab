.data
	myArray: .word 1,2,3,4,5,6,7,8,9,10
	promtp3: .asciiz "1,2,3,4,5,6,7,8,9,10\n"
	promtp2: .asciiz "The sum is: "
.text
	la $t0, myArray
	
	#print sum of all elements
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
	la $a0, promtp3
	syscall
	
	li $v0, 4
	la $a0, promtp2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
