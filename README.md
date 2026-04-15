# Validador de Contraseñas en Ensamblador (32 bits)
¡Hola! Este pequeño proyecto es un programa escrito en lenguaje Ensamblador de 32 bits (arquitectura x86). Su función es muy sencilla: te pide que ingreses una contraseña por teclado y te dice si has acertado o no.

Este proyecto ha sido realizado por Pablo Castro Rodríguez Y Álvaro Jorge González

La contraseña secreta configurada por defecto es 1234.

## ¿Cómo funciona por dentro?
Lo interesante de este código es que no utiliza funciones avanzadas (como strcmp en C) para comparar las palabras. En su lugar, hace el trabajo de forma manual y artesanal:

Te saluda: Usa la función printf de C para pedirte la contraseña.

Te escucha: Usa scanf para leer exactamente lo que escribes en el teclado y lo guarda en la memoria.

Compara letra por letra: Aquí está la magia. El programa toma la primera letra de tu entrada y la primera letra de la contraseña guardada. Si son iguales, pasa a la siguiente.

Toma una decisión: * Si en algún momento una letra no coincide, corta el proceso y te dice "Incorrecta!".

Si llega al final de ambas palabras y todas las letras coinciden, te felicita con un "Correcta!".

## Requisitos para usarlo
Para poder hacer funcionar este código, necesitas un entorno capaz de ensamblar y enlazar código de 32 bits. La opción más amigable es:

SASM (Simple Crossplatform Assembly IDE): Es un programa gratuito que ya trae todo configurado. ¡Solo copias el código, lo pegas y le das a ejecutar!

Si eres un usuario más avanzado, también puedes compilarlo manualmente usando NASM y GCC (MinGW en Windows o el paquete build-essential en Linux).

## Cómo ejecutarlo en SASM
Abre SASM.

Borra el código que aparece por defecto y pega el de este proyecto.

Asegúrate de tener SASM configurado en modo 32 bits (x86).

Presiona el botón verde de Ejecutar (o la tecla F5).

En la parte inferior, verás la pestaña de Entrada/Salida. Escribe una contraseña, presiona Enter y mira el resultado.

## Estructura del Código
Para que no te pierdas si quieres modificarlo, el código se divide en tres partes clave:

.data: Aquí viven los mensajes de texto que el programa te muestra y la contraseña original. Si quieres cambiar la contraseña secreta, ¡este es el lugar!

.bss: Es como una caja vacía donde el programa guarda temporalmente lo que tú escribes con el teclado (reserva 64 bytes de espacio).

.text: Aquí están las instrucciones, el "cerebro" del programa (main, el bucle de comparación y los mensajes finales).
