.global _start
// Calculo de factorial de n! 
_start:

mov r0, #1 // resultado
mov r1, #9 // valor de n

loop:

cmp r1, #1 //compara r1 con 1
ble _end   // termina 
mul r0, r1 //multiplicacion
sub r1, r1, #1 // n - 1
bal loop

_end:
mov r7, #1
swi #0	