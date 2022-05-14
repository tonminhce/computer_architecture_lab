.data 
 str: .asciiz "Ho Chi Minh"
 len: .word 11
 
 .text
 main:
 la $t0,str
 lw $t1,len
 addi $t1,$t1,-1
 
 while :
 	beq $t1,-1, exit
 	add $t3, $t0, $t1
 	lb $a0,($t3)
 	li $v0, 11
 	syscall
 	sub $t1,$t1,1
 	j while
 exit :
 	li $v0,10
 	syscall
