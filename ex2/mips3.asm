.data
	array: .space 100
	msg: .asciiz "Input 10 numbers: "
	space: .asciiz " "
.text
main:
	#print msg
	li $v0, 4
	la $a0, msg
	syscall
	
	li $t0, 0
	li $t1, 0
	la $s1, array
	la $s2, array
while:
	beq $t0, 10, print
	
	#read integer
	li $v0, 5
	syscall
	move $t2, $v0
	
	sw $t2, 0($s1) # t2 vao array
	addi $s1, $s1, 4
	addi $t0, $t0, 1
	j while
	
	
print:
	beq $t1, 10, exit
	
	lw $t2, 0($s1) 

	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $s1, $s1, 4
	addi $t1, $t1, 1
	j print
	
exit:
	li $v0, 10
	syscall