extern printf          ; declara función printf externa (C)
extern scanf           ; declara función scanf externa (C)

section .data          ; sección de datos (constantes)
    msg_prompt db "Introduce la contrasena: ", 0   ; mensaje de entrada
    msg_ok     db "Correcta!", 10, 0               ; mensaje si acierta
    msg_fail   db "Incorrecta!", 10, 0             ; mensaje si falla
    format_in  db "%s", 0                          ; formato string para scanf
    pwd        db "1234", 0                        ; contraseña correcta

section .bss           ; sección de variables sin inicializar
    input_pwd resb 64  ; reserva 64 bytes para la entrada

section .text          ; sección de código
    global main        ; punto de entrada principal

main:
    push msg_prompt    ; pasa mensaje a printf
    call printf        ; imprime mensaje
    add esp, 4         ; limpia la pila

    push input_pwd     ; dirección donde guardar entrada
    push format_in     ; formato "%s"
    call scanf         ; lee string del usuario
    add esp, 8         ; limpia la pila

    mov ecx, 0        ; inicializa índice en 0

comparar:
    mov al, [pwd + ecx]        ; carga carácter de contraseña correcta
    mov bl, [input_pwd + ecx]  ; carga carácter de entrada usuario

    cmp al, bl        ; compara ambos caracteres
    jne incorrecto    ; si son distintos, salta a incorrecto

    cmp al, 0         ; comprueba fin de cadena
    je correcto       ; si es fin y todo igual, es correcta

    inc ecx           ; siguiente carácter
    jmp comparar      ; repite bucle

correcto:
    push msg_ok       ; mensaje correcto
    call printf       ; imprime mensaje
    add esp, 4        ; limpia pila
    jmp fin           ; termina

incorrecto:
    push msg_fail     ; mensaje incorrecto
    call printf       ; imprime mensaje
    add esp, 4        ; limpia pila

fin:
    mov eax, 0        ; devuelve 0 (fin correcto)
    ret               ; retorna del programa
