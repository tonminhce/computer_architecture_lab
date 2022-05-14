.data
	file: .asciiz "C:\Users\tomym\Desktop\ex3\bai3\text.txt"    
	buffer: .space 1024
.text
	li $v0, 9 	
	li $a0, 1024 	
	syscall
	move $s0, $v0	
	
	li $v0, 13 	
	la $a0, file 	
	li $a1, 0 
	li $a2, 0 	
	syscall 	
	move $s6, $v0 	
	
	li $v0, 14 		
	move $a0, $s6 		
	la $a1, buffer 	
	li $a2, 44 	
	syscall 		
	
	add $t2, $zero, $zero
strlen:
	li $t0, 0 			
loop:
	lb $t1, buffer($t2) 	
	beqz $t1, exit 			
	addi $t2, $t2, 1 		
	addi $t0, $t0, 1 		
	j loop 				
exit:
	add $t3, $zero, $zero
Loop:
	lb $t1, buffer($t3)   
	sb $t1, 0($s0)	
	lb $t1, 0($s0)			
	li $v0, 11
	move $a0, $t1
	syscall
	addi $t3, $t3, 1		
	addi $s0, $s0, 1		
	bne $t3, $t0, Loop

	li $v0, 10
	syscall
