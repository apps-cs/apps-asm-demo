;***************************************************************************
;
; Program for education in subject "Computer Architecture and Paralel Systems"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Examples of addresing global variables
;
;***************************************************************************

    bits 64

    section .data

    ; extern variables
    extern  g_character
    extern  g_integer
    extern  g_longint

    extern g_index
    extern g_value

    ; extern arrays
    extern g_string
    extern g_int_array
    extern g_long_array

    section .text

;***************************************************************************
    ; assign a constant into global variables

    global set_variables

set_variables:
    enter 0,0

    mov byte [ g_character ], 'X'           ; g_character = 'X';
    mov dword [ g_integer ], 12345          ; g_integer = 12345;
    mov qword [ g_longint ], 0x12345678     ; g_longint = 0x12345678;

    leave
    ret
    
;***************************************************************************
    ; move value from g_value into g_index

    global move_int_values

move_int_values:
    enter 0,0

    mov ecx, [ g_value ]    ; ecx = g_value
    mov [ g_index ], ecx    ; g_index = ecx

    leave
    ret
    
;***************************************************************************
    ; move value from g_character into g_integer

    global move_char_to_int

move_char_to_int:
    enter 0,0

    movsx eax, byte [ g_character ] ; eax = g_character
    mov [ g_integer ], eax          ; g_integer = eax

    leave
    ret
    
;***************************************************************************
    ; move value from g_integer into g_longint

    global move_int_to_long

move_int_to_long:
    enter 0,0

    movsx rax, dword [ g_integer ]  ; rax = g_integer
    mov [ g_longint ], rax          ; g_longing = rax

    leave
    ret
    
;***************************************************************************
    ; rewrite content of global string

    global set_string

set_string:
    enter 0,0

    mov byte [ g_string + 5 ], 'w'      ; g_string[ 5 ] = 'w'
    mov byte [ g_string + 6 ], 'e'      ; g_string[ 6 ] = 'e'
    mov byte [ g_string + 7 ], 'e'      ; g_string[ 7 ] = 'e'
    mov byte [ g_string + 8 ], 'n'      ; g_string[ 8 ] = 'n'
    mov byte [ g_string + 9 ], ':'      ; g_string[ 9 ] = ':'
    mov byte [ g_string + 10 ], '-'     ; g_string[ 10 ] = '-'
    mov byte [ g_string + 11 ], ')'     ; g_string[ 11 ] = ')'

    leave
    ret

;***************************************************************************
    ; rewrite content of global array

    global set_int_array

set_int_array:
    enter 0,0

    mov dword [ g_int_array + 0 * 4 ], 1        ; g_int_array[ 0 ] = 1
    mov dword [ g_int_array + 2 * 4 ], 22       ; g_int_array[ 2 ] = 22
    mov dword [ g_int_array + 4 * 4 ], 333      ; g_int_array[ 4 ] = 333
    mov dword [ g_int_array + 6 * 4 ], 4444     ; g_int_array[ 6 ] = 4444
    mov dword [ g_int_array + 8 * 4 ], 55555    ; g_int_array[ 8 ] = 55555

    leave
    ret
    
;***************************************************************************
    ; rewrite content of global array

    global set_long_array

set_long_array:
    enter 0,0

    mov qword [ g_long_array + 1 * 8 ], -10     ; g_long_array[ 1 ] = -10
    mov qword [ g_long_array + 3 * 8 ], -20     ; g_long_array[ 3 ] = -20
    mov qword [ g_long_array + 5 * 8 ], -30     ; g_long_array[ 5 ] = -30
    mov qword [ g_long_array + 7 * 8 ], -40     ; g_long_array[ 7 ] = -40
    mov qword [ g_long_array + 9 * 8 ], -50     ; g_long_array[ 9 ] = -50

    leave
    ret
 
;***************************************************************************
    ; rewrite one character of g_string at g_index position

    global set_string_index

set_string_index:
    enter 0,0

    mov rax, 0
    mov eax, [ g_index ]                ; 64-bit address
    mov byte [ g_string + rax ], '.'    ; g_string[ g_index ] = '.'

    leave
    ret
 
;***************************************************************************
    ; rewrite one element of g_int_array at g_index position

    global set_int_array_index

set_int_array_index:
    enter 0,0

    mov rax, 0
    mov eax, [ g_index ]                        ; 64-bit address
    mov dword [ g_int_array + rax * 4 ], 646464 ; g_int_array[ g_index ] = 646464

    leave
    ret
 
;***************************************************************************
    ; rewrite one element of g_long_array at g_index position

    global set_long_array_index

set_long_array_index:
    enter 0,0

    mov rax, 0
    mov eax, [ g_index ]                         ; 64-bit address
    mov qword [ g_long_array + rax * 8 ], 128128 ; g_long_array[ g_index ] = 128128

    leave
    ret
 
;***************************************************************************
    ; rewrite one character of g_string at g_index position with g_value

    global set_string_index_value

set_string_index_value:
    enter 0,0

    mov cl, [ g_value ]         ; cl = g_value
    mov rax, 0
    mov eax, [ g_index ]        ; 64-bit address
    mov [ g_string + rax ], cl  ; g_string[ g_index ] = cl

    leave
    ret
 
;***************************************************************************
    ; rewrite one element of g_int_array at g_index position with g_value

    global set_int_array_index_value

set_int_array_index_value:
    enter 0,0

    mov ecx, [ g_value ]                ; ecx = g_value
    movsx rax, dword [ g_index ]        ; 64-bit address
    mov [ g_int_array + rax * 4 ], ecx  ; g_int_array[ g_index ] = ecx

    leave
    ret
 
;***************************************************************************
    ; rewrite one element of g_long_array at g_index position with g_value

    global set_long_array_index_value

set_long_array_index_value:
    enter 0,0

    movsx rcx, dword [ g_value ]        ; rcx = g_value with sign extension
    movsx rax, dword [ g_index ]        ; 64-bit address
    mov [ g_long_array + rax * 8 ], rcx ; g_long_array[ g_index ] = rcx

    leave
    ret

