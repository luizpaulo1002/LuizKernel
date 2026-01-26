; Constantes Multiboot
MBALIGN  equ 1 << 0                 ; alinha módulos carregados
MEMINFO  equ 1 << 1                 ; fornece mapa de memória
FLAGS    equ MBALIGN | MEMINFO      ; flags do Multiboot
MAGIC    equ 0x1BADB002              ; número mágico do Multiboot
CHECKSUM equ -(MAGIC + FLAGS)        ; checksum

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

section .bss
align 16
stack_bottom:
    resb 16384  ; 16 KB de stack
stack_top:

section .text
global _start
extern kernel_main

_start:
    ; Configurar stack
    mov esp, stack_top

    ; Chamar kernel
    call kernel_main

    ; Se o kernel retornar, desligar com halt
    cli
.hang:
    hlt
    jmp .hang