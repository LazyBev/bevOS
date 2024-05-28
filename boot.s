bits 32

section .text
    align 4
    dd 0x1badb002
    dd 0x00000000
    dd -(0xbadb002 + 0x00000000)

global start
extern kmain

start:
    cli
    mov esp, stack_space
    call kmain
    hlt

halt_kernel:
    cli
    hlt 
    jmp halt_kernel

section .bss
resb 8192
stack_space:
