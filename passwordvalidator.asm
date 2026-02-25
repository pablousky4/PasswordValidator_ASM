_start
%include "io64.inc"

extern printf

section .data
    password db "1234", 0
    mensaje db "Sistema iniciado", 10, 0

section .text
global main

main:
    mov rcx, mensaje
    call printf
    
    ret
