.section .vectors
vector_table:
    .word 0xABC0          // Initial value for Stack Pointer (SP)
    .word reset_handler   // Reset Vector (address of Reset Handler)
    .zero 400             // Reserve 400 bytes

.section .text
.align 1
.type reset_handler, %function
reset_handler:
    mov r1, #0x1
    mov r2, #0x2
    add r3, r1, r2
    bl .                  // Branch to itself (infinite loop)


