%include "io.inc"

extern printf

section .data
    password db "1234", 0
    mensaje db "Sistema iniciado", 10, 0

section .text
global main

main:
    push mensaje
    call printf
    add esp, 4

    ret
