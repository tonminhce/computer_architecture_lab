.data
       Option: .asciiz "Please pick the shape you desire to calculate: \n[1]circle\n[2]triangle\n[3]rectangle\n[4]square\nYour choice: "
       Invalid: .asciiz "***INVALID! Please choose again!***\n"
       height: .asciiz "Input the height: "
       length: .asciiz "Input the length: "
       base: .asciiz "Input the base: "
       radius: .asciiz "Input the radius: "
       output: .asciiz "Result: "
       pi: .float 3.1415926
       num2: .float 0.5
       asking: .asciiz "\n\nContinue calculating?? [1] - YES | [any number except 1] - NO\n"
.text
main:
       li $v0, 4
       la $a0, Option
       syscall      
       
       li $v0, 5
       syscall
       move $t0, $v0 
       
       beq $t0, 1, circle
       beq $t0, 2, triangle
       beq $t0, 3, rectangle
       beq $t0, 4, square
       j invalid
invalid:
       li $v0, 4
       la $a0, Invalid
       syscall
       j main
circle:
        li $v0, 4
	la $a0, radius			
	syscall
	addi $v0, $0, 6			
	syscall
	mul.s $f12, $f0, $f0		
	l.s $f4, pi				
	mul.s $f12, $f12, $f4		
	addi $v0, $0, 4		
	la $a0, output	
	syscall
	addi $v0, $0, 2		
	syscall
	j exit
	
triangle:
li $v0, 4
        la $a0, height		
	syscall
	addi $v0, $0, 6		
	syscall
	
	mov.s $f12, $f0			
	
	addi $v0, $0, 4			
	la $a0, base		
	syscall
	addi $v0, $0, 6
	syscall
	
	mul.s $f12, $f12, $f0	
	
	l.s $f4, num2
	mul.s $f12, $f12, $f4	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 2		
	syscall
	j exit
rectangle:
        li $v0, 4
        la $a0, height		
	syscall
	addi $v0, $0, 7			
	syscall
	
	mov.d $f12, $f0			
	
	addi $v0, $0, 4			
	la $a0, base		
	syscall
	addi $v0, $0, 7	
	syscall
	
	mul.d $f12, $f12, $f0		
	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 3			
	syscall
	j exit
square:
        li $v0, 4
        la $a0, length		
	syscall
	addi $v0, $0, 7			
	syscall
	
	mov.d $f12, $f0			
	
	mul.d $f12, $f12, $f12
	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 3			
	syscall
	j exit
exit:
        li $v0, 4
        la $a0, asking
        syscall
        li $v0, 5
        syscall
        beq $v0, 1, main
        li $v0, 10
	syscall