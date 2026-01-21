;hola mundo
extern printf
extern ExitProcess

section .data
    mensaje db "Hola mundo", 10, 0

section .text
    global main

main:
    push mensaje
    call printf
    add esp, 4

    push 0
    call ExitProcess