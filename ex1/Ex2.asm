.data
promt: .asciiz "Enter number 1\n"
promt1: .asciiz "Enter number 2\n"
result: .asciiz "The result\n"
.text
main:
	# promt user for input
	la $a0, promt
	li $v0, 4
	syscall
	# read input 1
	li $v0, 5
	syscall
	move $t0, $v0
	# input 2
    	li $v0, 4
    	la $a0, promt1
    	syscall
    	#read input 2
    	li $v0,5        
        syscall
   	move $t1,$v0
   	# Sum
   	add $t2, $t1, $t0
   	#print the result
   	li $v0, 4      
	la, $a0, result
	syscall
    	li, $v0,1
    	move $a0, $t2 
    	syscall
    	li $v0, 10
    	syscall