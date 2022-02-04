;***************************************************************************
;
; Program for education in subject "Assembly Languages" and "APPS"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Usage of variables in Assembly language
;
;***************************************************************************

    bits 64

    section .data

    ; external variables declared in C
    extern g_c_array, g_c_array_length, g_c_int
    extern g_c_byte, g_c_hello, g_c_4chars

    ; list of public variables
    global g_a_first_last, g_a_4chars, g_a_byte_int, g_a_int

g_a_first_last dd      0,0                 ; int[ 2 ]
g_a_4chars     db      0,0,0,0,0           ; char[ 5 ]
g_a_byte_int   dd      0                   ; int
g_a_int        dd      0                   ; int

    section .text

;***************************************************************************
    ; Function shows int variables using.

    global  access_int
access_int:
    ; Content of variable g_c_int will be moved to variable g_a_int.
    mov eax, [ g_c_int ]
    mov [ g_a_int ], eax
    ret

;***************************************************************************
    ; Function shows char and int variable using.

    global access_char
access_char:
    ; Content of variable g_c_byte will be moved to variable g_a_byte_int.
    ; Both variable have different size and therefore is necessary
    ; to fill missing part by zeroes.
    mov eax, 0
    mov al, [ g_c_byte ]
    mov [ g_a_byte_int ], eax
    ret

;***************************************************************************
    ; Functions shows array element access

    global access_array
access_array:
    ; Function move content of first and last members of g_c_array
    ; to two elements array g_a_first_last.
    ; Length of array is stored in g_c_array_length
    mov eax, [ g_c_array + 0 ]
    mov [ g_a_first_last + 0 ], eax

    mov rcx, 0
    mov ecx, dword [ g_c_array_length ]   ; length of array
    mov eax, [ g_c_array + ( rcx - 1 ) * 4 ] 
    mov [ g_a_first_last + 1 * 4 ], eax
    ret

;***************************************************************************
    ; Function shows access to characters in string.

    global access_string
access_string:
    ; Function rewrites first word in string g_c_hello
    ; and moves content of variable g_c_4chars to strin_4chars. 
    mov [ g_c_hello + 0 ], byte 'N'
    mov [ g_c_hello + 1 ], byte 'i'
    mov [ g_c_hello + 2 ], byte 'c'
    mov [ g_c_hello + 3 ], byte 'e'

    mov al, [ g_c_4chars + 0 ]
    mov [ g_a_4chars + 0 ], al
    mov al, [ g_c_4chars + 1 ]
    mov [ g_a_4chars + 1 ], al
    mov al, [ g_c_4chars + 2 ]
    mov [ g_a_4chars + 2 ], al
    mov al, [ g_c_4chars + 3 ]
    mov [ g_a_4chars + 3 ], al
    ret
    

