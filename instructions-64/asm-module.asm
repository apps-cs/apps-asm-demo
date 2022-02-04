;***************************************************************************
;
; Program for education in subject "Computer Architectures and Paralel Systems"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Usage of Arithmetic and Bitwise Instruction
; Usage of Conditional Jumps
;
;***************************************************************************
    bits 64

    section .data
    extern g_int_val1, g_int_val2
    extern g_long_array, g_long_mean
    extern g_int_number
    extern g_int_array, g_int_mean, g_odd_numbers
    extern g_char_array, g_char_array_len, g_char_replace

    section .text

;***************************************************************************
    ;************************************************************************
    ; move low nibbles from g_int_val1 to g_int_val2

    global move_low_nibbles
move_low_nibbles:
    enter 0,0

    mov edx, 0x0F0F0F0F     ; mask = low nibbles
    mov eax, [ g_int_val1 ] ; eax = g_int_val1
    and eax, edx            ; only low nibles in eax 
    not edx                 ; ~mask (high nibbles)
    and [ g_int_val2 ], edx ; g_int_val &= mask (only high nibbles)
    or [ g_int_val2 ], eax  ; g_int_va2 |= eax

    leave
    ret

;***************************************************************************
    ; compute mean value of g_long_array

    global mean_long_array
mean_long_array:
    enter 0,0

    mov rax, [ g_long_array + 0 * 8 ]   ; sum = g_long_array[ 0 ]
    add rax, [ g_long_array + 1 * 8 ]   ; sum += g_long_array[ 1 ]
    add rax, [ g_long_array + 2 * 8 ]   ; sum += g_long_array[ 2 ]
    add rax, [ g_long_array + 3 * 8 ]   ; sum += g_long_array[ 3 ]

    shr rax, 2                          ; sum /= 4
    mov [ g_long_mean ], rax            ; g_long_mean = sum

    leave
    ret

;***************************************************************************
    ; multiply g_int_number by 10 using shl and add

    global mult_int_number_10
mult_int_number_10:
    enter 0,0

    mov eax, [ g_int_number ]   ; eax = g_int_number
    shl eax, 1                  ; eax *= 2
    mov ecx, eax                ; ecx = eax
    shl ecx, 2                  ; ecx *= 4 (g_int_number * 8)
    add eax, ecx                ; eax += ecx
    mov [ g_int_number ], eax   ; g_int_number *= 10;

    leave
    ret

;***************************************************************************
    ; mean value of g_int_array

    global mean_int_array
mean_int_array:
    enter 0,0

    mov eax, 0                          ; sum = 0

    ; incorrect for ( rcx = 0; rcx < 8; rcx++ )
    mov rcx, 0
.back:
    add eax, [ g_int_array + rcx * 4 ]  ; sum += g_int_array[ rcx ]
    inc rcx                             ; rcx++
    cmp rcx, 8                          ; rcx < 8 ?
    jl .back                            ; yes? jump .back
    ; end for

    shr eax, 3                          ; sum /= 8
    mov [ g_int_mean ], eax             ; g_int_mean = sum

    leave
    ret

;***************************************************************************
    ; count odd numbers in g_int_array

    global odd_numbers_int_array
odd_numbers_int_array:
    enter 0,0

    mov ecx, 0                          ; ecx - counter
    ; for ( rdx = 0; rdx < 8; rdx++ )
    mov rdx, 0
.back:
    cmp rdx, 8                          ; rdx < 8 ?
    jnl .end_for                        ; no? jump .end_for

    ;test dword [ g_int_array + rdx * 4 ], 1
    mov eax, [ g_int_array + rdx * 4 ]
    and eax, 1                          ; if ( g_int_array[ rdx ] & 1 ) 
    jz .no_odd
    inc ecx                             ; { ecx++ }
.no_odd:                               

    inc rdx                             ; rdx++
    jmp .back
.end_for:

    mov [ g_odd_numbers ], ecx          ; g_odd_numbers = ecx

    leave
    ret

;***************************************************************************
    ; count lenght of g_char_array

    global char_array_length
char_array_length:
    enter 0,0

    mov rcx, 0                      ; rcx - lenght
.back:                          
    ; while ( g_char_array[ rcx ] != '\0' ) 
    cmp [ g_char_array + rcx ], byte 0
    je .found_0                 
    inc rcx                         ; { rcx++ }
    jmp .back
.found_0:

    mov [ g_char_array_len ], rcx   ; g_char_len = ecx

    leave
    ret

;***************************************************************************
    ; replace digits in g_char_array with g_char_replace

    global char_array_replace
char_array_replace:
    enter 0,0

    mov rdx, 0
    mov al, [ g_char_replace ]
.back:
    cmp [ g_char_array + rdx ], byte 0
    je .found_0

    cmp [ g_char_array + rdx ], byte '0' ; if ( g_char_array[ rdx ] >= '0' &&
    jb .no_digit
    cmp [ g_char_array + rdx ], byte '9' ;      g_char_array[ rdx ] <= '9' ) 
    ja .no_digit

    mov [ g_char_array + rdx ], al  ; { g_char_array[ rdx ] = al }

.no_digit:
    inc rdx                         ; rdx++
    jmp .back

.found_0:

    leave
    ret




