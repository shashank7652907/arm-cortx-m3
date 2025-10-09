# SysTick configuration registers
.equ systick_csr,    0xE000E010
.equ systick_rvr,    0xE000E014
.equ systick_cvr,    0xE000E018
.equ systick_calib,  0xE000E01C

.equ timout,         0x00FFFFFF

.section .vectors
vector_table:
    .word 0x20001000          # Initial stack pointer
    .word reset_handler       # Reset vector
    .org 0x3C
    .word systick_handler     # SysTick interrupt vector
    .zero 400

.section .text
.align 1
.type reset_handler, %function
reset_handler:
    ldr r0, =systick_csr
    ldr r1, =systick_rvr
    ldr r2, =systick_cvr
    ldr r3, =timout

    str r3, [r1]              # Load reload value
    mov r3, #0x0
    str r3, [r2]              # Clear current value
    mov r3, #0x7
    str r3, [r0]              # Enable SysTick (CLKSOURCE=1, TICKINT=1, ENABLE=1)

    mov r5, #0                # Counter variable

loop_forever:
    b loop_forever

.section .text
.align 1
.type systick_handler, %function
systick_handler:
    add r5, r5, #1            # Increment counter each interrupt
break_here:
    bx lr


