#	Computer Systems Organization
#	Winter Semester 2021-2022
#	1st Assignment
#
# 	Pseudocode by MARIA TOGANTZH (mst@aueb.gr)
#
# 	MIPS Code by Petsa Georgia, p3200155@aueb.gr, id: 3200155 
# 	(Please note your name, e-mail and student id number)


	.text
	.globl __start		

# ------------------- Read and Validate Data ------------------------------

__start:	  		 	
	lw $t6, counter		# counter = 4
	
	lw $t2, orio		# orio = 48 (o asci code gia to 0)
	lw $t3, orio2 		# orio2 = 57 (o asci code gia to 9)
	lw $t4, A			# A = 65 (o asci code gia to A)
	lw $t7, F			# F = 70 (o asci code gia to F)
loop: 	
	blez $t6, exit_loop	# while counter != 0 do
	
	li $v0, 12 			# Read hex character in $v0
	syscall				#
						#	
						#			
	blt $v0, $t2, exit_on_error	# 	if charakter is not ('0'..'9') and is not ('A'..'F') then
	ble $v0, $t3, isHex			# 			goto exit_on_error
	bge	$v0, $t4, elegxos     	# 		else  
	j exit_on_error				# 			goto isHex
	
elegxos:
	bgt $v0, $t7, exit_on_error  
								
								
									
								
isHex:
	lw $t5, bit					# bit = 8
	sll $t1, $t1, $t5			# 	shift left $t1
	or $t1, $t1, $v0			# 	pack $v0 to $t1 
	addi $t6, -1				# 	counter = counter - 1
								#
	j loop						# goto loop
		
# ------------------- Calculate Decimal Number -----------------------------		

exit_loop:				# print '\n'
	la $a0, str1		#
	li $v0, 4			#
	syscall				#
	lw $t7, result		# result = 0
						#
	lw $t6, counter 	# counter = 4
						# 
	lw $t8, powerr		# power = 1 (16^0)
						# 
	lw $s1, num			# $s1 = 255 (mask = 11111111)
						#
loop2:					# while counter != 0 do
	blez $t6, exit_loop2# 	
	and $t2, $t1, $s1	# 	$t2 =  least significant byte from $t1 (unpack)
	srl $t1, $t1, $t5	# 	shift right $t1 

	bge $t2, $t4, then	# if $t2 is letter A..F then
	addi $t2, -48		# 		$t2 = $t2 - 55
	j continue			# 	else 
then:					#		$t2 = $t2 - 48
	addi $t2, -55
						#

continue:				#
						#
	mul $t2, $t2, $t8	# 	$t2 = $t2 * power
	lw $t9,	dekaksi
	mul $t8, $t8, $t9	# 	power = power * 16
	addi $t6, -1		# 	counter = counter - 1
	add $t7, $t7, $t2 	# 	result = result + $t2
						#
	j loop2					# goto loop2

# ------------------- Print Results ------------------------------------		

exit_loop2:				# print result
	move $a0, $t7 		
	li $v0, 1
	syscall				
	j exit				# goto exit
						#
exit_on_error:			#
						# 
	la $a0, str1			#
	li $v0, 4			#
	syscall				# print '\n'
						#
	la $a0, error		#
	li $v0, 4			#
	syscall				# print error message
						#
						#
						#
exit:					# 
	la $a0, str1			#
	li $v0, 4			#
	syscall				# print '\n'
						#
	li $v0, 10 			# exit
	syscall				#			
						#
						#

	.data
x: .space 4
counter: .word 4
orio: .word 48
orio2: .word 57
A: .word 65
F: .word 70
bit: .word 8	
result: .word 0
powerr: .word 1
str1: .asciiz "\n"
num: .word 255
dekaksi: .word 16
error: .asciiz "Wrong Hex Number ..." 
