.global _start
_start:
    LDR r1, =array          // Cargar la direccion base del arreglo en r1
    LDR r2, =y              // Cargar la direccion de la constante 'y' en r2
    LDR r2, [r2]            // Cargar el valor de 'y' desde memoria
    MOV r0, #0              // Inicializar el índice i = 0

loop_start:
    CMP r0, #10             // Comparar indice i con 10 (longitud del arreglo)
    BGE loop_end            // Si i >= 10, terminar el bucle

    LDR r3, [r1, r0, LSL #2] // Cargar array[i] en r3 (cada elemento ocupa 4 bytes)

    CMP r3, r2              // Comparar array[i] con y
    BLT suma         // Si array[i] < y, ir a la rama de suma

    // Multiplicacion: array[i] = array[i] * y
    MUL r4, r3, r2          // r4 = array[i] * y
    STR r4, [r1, r0, LSL #2] // Guardar el resultado en array[i]
    B prox_iter        // Ir a la siguiente iteracion

suma:
    // Suma: array[i] = array[i] + y
    ADD r4, r3, r2          // r4 = array[i] + y
    STR r4, [r1, r0, LSL #2] // Guardar el resultado en array[i]

prox_iter:
    ADD r0, r0, #1          // Incrementar el indice i
    B loop_start            // Volver al inicio del bucle

loop_end:
    // Salir del programa
    MOV r7, #1              // syscall: exit
    MOV r0, #0              // Codigo de salida 0
    SWI 0                   // Interrupcion para salir

    .section .data          // Seccion de datos
array:
    .word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 // Arreglo de ejemplo
y:
    .word 15                // Constante y