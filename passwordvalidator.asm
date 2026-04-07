%include "io.inc"

extern printf
extern scanf

section .data
    password db "1234", 0
    mensaje db "Sistema iniciado", 10, 0
    pedir db "Introduce la contraseña: ", 0
    formato db "%s", 0

section .bss
    input resb 20   ; espacio para 20 caracteres

section .text
global main

main:
    ; Mostrar mensaje inicial
    push mensaje
    call printf
    add esp, 4

    ; Pedir contraseña
    push pedir
    call printf
    add esp, 4

    ; Leer input del usuario
    push input
    push formato
    call scanf
    add esp, 8

    ret
