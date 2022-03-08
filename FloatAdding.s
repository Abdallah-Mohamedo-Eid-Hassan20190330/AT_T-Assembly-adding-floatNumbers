.section .data
input: .asciz "%lf"
inputn : .asciz "%d"
output: .asciz "the sum is %lf"
out : .asciz "the avg is : %f"
n: .int 0 
avg: .double 0.0
sum: .double 0.0
num: .double 0.0

.section .bss
.lcomm arr , 400

.section .text
.global _main
_main:
pushl $n
pushl $inputn
call _scanf
add $8 , %esp

movl n , %ecx
movl $arr , %ebx 

loopl :
pushl %ecx
pushl %ebx 

pushl %ebx 
pushl $input 
call _scanf
add $8 , %esp 

popl %ebx 
popl %ecx
add $8, %ebx
loop loopl

movl n , %ecx 
movl $0 , %eax 
movl $0 , %ebx 

loopy :
fldl sum 
faddl  arr(, %ebx , 8 ) 
fstpl sum 
add $1 , %ebx 
loop loopy 


pushl %ebx
pushl sum+4
pushl sum  
pushl $output
call _printf
add $12 , %esp
popl %ebx
movl %ebx , num
fldl sum 
fidivl num
fstpl avg 

pushl avg+4
pushl avg
pushl $out
call _printf
add $12 , %esp


ret
