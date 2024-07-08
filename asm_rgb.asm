; LBYARCH S14 - MCO1
; Yazan Homssi & Aebrahm Ramos

section .text
global cvtRGBToGray

cvtRGBToGray:
    ;write your code here

    ; Function parameters:
    ; rcx - img2 (destionation, 2 dimensional))
    ; rdx - img1 (source RGB, 3 dimensional)
    ; r8d - m (width of the image)
    ; r9d - n (height of the image)

    push rbp
    mov rbp, rsp
    push rsi
    push rdi

    ; Calculate total number of pixels
    mov eax, r8d
    imul eax, r9d

    mov r10d, eax  ; r10d = total number of pixels
    mov rsi, rdx   ; rsi = source pointer (img1)
    mov rdi, rcx   ; rdi = destination pointer (img2)
    xor r11, r11   ; r11 = pixel counter

loopStart:
    ; can we add comments on each line so I don't have to mentally do the computation? ANS: Done :)
    ; Calculate grayscale value: gray = (R + G + B) / 3
    movzx eax, byte [rsi]       ; Set eax to the Red value
    movzx ecx, byte [rsi + 1]   ; Set ecx to the Green value
    add eax, ecx                ; Add Red and Green
    movzx edx, byte [rsi + 2]   ; Set edx to the Blue values
    add eax, edx                ; Add Red, Green, and Blue
    mov ecx, 3                  ; Set 3 as divisor
    xor edx, edx                ; Empty out edx
    div ecx                     ; Divide eax by ecx

    ; Store grayscale value
    mov byte [rdi], al

    add rsi, 3  ; Move to next RGB pixel in input
    inc rdi     ; Move to next grayscale pixel in output
    inc r11     

    ; Check if we've processed all pixels
    cmp r11, r10
    jl loopStart

    pop rdi
    pop rsi
    pop rbp
    ret