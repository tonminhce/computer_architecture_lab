.data
       Smallspeech: .asciiz "Please input the following value to calculate the integral\n-------------\n"
       U: "Please input value of lower bound u: "
       V: "Please input value of upper bound v: "
       A: "Please input value of a: "
       B: "Please input value of b: "
       C: "Please input value of c: "
       output: .asciiz "Result: "
       numhalf: .float 0.5
       numthird: .float 0.333333333333333333333333333333333333333333333333333333333333333333333333333333
       Invalid: .asciiz "***Invalid choice***"
       asking: .asciiz "\n\nContinue calculating??\n[1] - YES\n[2] - NO\n"
.text
main:
       li $v0, 4
       la $a0, Smallspeech
       syscall      
	
INPUT:
        li $v0, 4
        la $a0, V
	syscall
	addi $v0, $0, 6		
	syscall
	mov.s $f2, $f0			
	
	li $v0, 4
        la $a0, U
	syscall
	addi $v0, $0, 6		
	syscall
	mov.s $f4, $f0	
	
	li $v0, 4
	la $a0, A
	syscall
	addi $v0, $0, 6		
	syscall
	mov.s $f6, $f0	
	
	li $v0, 4
	la $a0, B	
	syscall
	addi $v0, $0, 6		
	syscall
	mov.s $f8, $f0	
	
	li $v0, 4
	la $a0, C
	syscall
	addi $v0, $0, 6		
	syscall
	mov.s $f10, $f0	
CALCU:
	#f12 v^3
	mul.s $f30, $f2, $f2
	mul.s $f30, $f30, $f2	
	
	#f14 v^2
	mul.s $f14, $f2, $f2
	
	#f16 u^3
	mul.s $f16, $f4, $f4
	mul.s $f16, $f16, $f4	
	
	#f18 u^2
	mul.s $f18, $f4, $f4
	
	#f20 = 0.5
	#f22 = 0.33
	l.s $f20, numhalf
	l.s $f22, numthird
	
	#calcu a b c
	mul.s $f6, $f6, $f22
	mul.s $f8, $f8, $f20
	
	#real calcu 
	mul.s $f24, $f30, $f6     #calcu upper bound
	mul.s $f26, $f8, $f14
	add.s $f24, $f24, $f26
	mul.s $f26, $f10, $f2
	add.s $f24, $f24, $f26
	
	mul.s $f28, $f16, $f6     #calcu lower bound
	mul.s $f26, $f8, $f18
	add.s $f28, $f28, $f26
	add.s $f26, $f1,$f1
	mul.s $f26, $f10, $f4
	add.s $f28, $f28, $f26
	
	sub.s $f12, $f24, $f28
	
	addi $v0, $0, 4			
	la $a0, output		
	syscall
	addi $v0, $0, 2		
	syscall
	j exit

exit:
        li $v0, 4
        la $a0, asking
        syscall
        li $v0, 5
        syscall
        beq $v0, 1, main
        beq $v0, 2, realexit
        j invalid
invalid:
        li $v0, 4
        la $a0, Invalid
        syscall
        j exit
realexit:
        li $v0, 10
	syscall