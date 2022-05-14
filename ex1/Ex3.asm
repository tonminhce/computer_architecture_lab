.data
promt: .asciiz "Enter number a\n"
promt1: .asciiz "Enter number b\n"
promt2: .asciiz "Enter number c\n"
promt3: .asciiz "Enter number d\n"
result: .asciiz "The result of f\n"
result1: .asciiz "The result of g\n" 
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
   	# input 3
    	li $v0, 4
    	la $a0, promt2
    	syscall
    	#read input 3
    	li $v0,5        
        syscall
   	move $t2,$v0
   	# input 4
    	li $v0, 4
    	la $a0, promt3
    	syscall
    	#read input 4
    	li $v0,5        
        syscall
   	move $t3,$v0
   	#sum a+b to t4
   	add $t4, $t1, $t0
   	#sub c-d to t5
   	sub $t5,$t2,$t3
   	#sub c-d-2
   	addi $t6,$t5,-2
   	#Answer f
   	sub $t7,$t4,$t6
   	#print result f
   	li $v0, 4      
	la, $a0, result
	syscall
    	li, $v0,11
    	move $a0, $t7 
    	syscall
    	# (a+b)*2
    	add $t5,$t4,$t4
    	# c+d
    	add $t6,$t2,$t3
    	#(c+d)*2
    	add $t7,$t6,$t6
    	#Answer g
    	add $t8,$t5,$t7
    	#print result g
   	li $v0, 4      
	la, $a0, result1
	syscall
    	li, $v0,11
    	move $a0, $t8 
    	syscall
    	#end program
    	li $v0, 10
    	syscall
    	
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	