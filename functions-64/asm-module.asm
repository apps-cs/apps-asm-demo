;***************************************************************************
;
; Program for education in subject "Assembly Languages" and "APPS"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Implementation of functions with parameters
;
;***************************************************************************

    bits 64

    section .data

    section .text

;***************************************************************************
    ;int sum( int t_a, int t_b );

    global sum_int
sum_int:
    enter 0,0

    xor rax, rax                
    mov eax, edi                ; parameter t_a
    add eax, esi                ; t_a += t_b
                                ; return value is in eax
    leave
    ret

;***************************************************************************
    ;long sum( long t_a, long t_b );

    global sum_long
sum_long:
    enter 0,0

    mov rax, rdi                ; parameter t_a
    add rax, rsi                ; t_a += t_b
                                ; return value is in rax
    leave
    ret

;***************************************************************************
    ;int char_in_range( char t_c, char t_low, char t_high );

    global char_in_range
char_in_range:
    enter 0,0
    
    mov eax, 0      ; ret 0

    cmp dil, sil    ; cmp t_c, t_low 
    jb .ret
    cmp dil, dl     ; cmp t_c, t_high
    ja .ret
    
    mov eax, 1      ; ret 1
.ret:
    leave
    ret

;***************************************************************************
    ;int sum_int_array( int *t_array, int t_N );

    global sum_int_array
sum_int_array:
    enter 0,0

    movsx rsi, esi              ; length of t_array 
    mov rax, 0                  ; l_sum = 0
    mov rcx, 0                  ; i = 0
.back:
    cmp rcx, rsi                ; i < t_N
    jge .endfor

    add eax, [ rdi + rcx * 4 ]  ; l_sum += t_array[ rcx ]
    
    inc rcx                     ; i++
    jmp .back
.endfor:
                                ; result is in eax
    leave
    ret

;***************************************************************************
    ;int average_int_array( int *t_array, int t_N );

    global average_int_array
average_int_array:
    enter 0,0

    movsx rsi, esi              ; length of t_array 
    mov rax, 0                  ; l_sum = 0
    mov rcx, 0                  ; i = 0
.back:
    cmp rcx, rsi                ; i < t_N
    jge .endfor

    movsx rdx, dword [ rdi + rcx * 4 ]
    add rax, rdx                ; l_sum += t_array[ i ]
    
    inc rcx                     ; i++
    jmp .back
.endfor:
    cqo                         ; extenstion of rax to rdx
    movsx rcx, esi              ; t_N
    idiv rcx                    ; l_sum /= t_N
                                ; result is in eax
    leave
    ret

;***************************************************************************
    ;long strlength( char *t_str );

    global strlength
strlength:
    enter 0,0

    mov rax, 0                  ; l_len = 0
.back:
    cmp byte [ rdi + rax ], 0   ; while ( t_str[ l_len ] != 0 )
    je .done
    inc rax                     ; l_len++
    jmp .back
.done:
                                ; return in rax
    leave
    ret

;***************************************************************************
    ;int division_int( int t_a, int t_b, int *t_remainder );

    global division_int
division_int:
    enter 0,0

    mov rcx, rdx                ; save *t_remainder
    mov eax, edi                ; parameter t_a to eax
    cdq                         ; externsion of eax do edx
    idiv esi                    ; eax /= t_b
                                ; result is in eax
                                ; remainder is in edx
    mov [ rcx ], edx            ; *t_remainder = edx

    leave
    ret

;***************************************************************************
    ;long division_long( long t_a, long t_b, long *t_remainder );

    global division_long
division_long:
    enter 0,0

    mov rcx, rdx                ; save *t_remainder
    mov rax, rdi                ; parameter t_a to eax
    cqo                         ; extension of rax to rdx
    idiv rsi                    ; rax /= t_b
                                ; result is in rax
                                ; remainder v rdx
    mov [ rcx ], rdx            ; *t_remainder = rdx

    leave
    ret

;***************************************************************************
    ;char *strmirror( char *t_str );

    global strmirror
    extern strlen
strmirror:
    enter 0,0

    push rdi                    ; save rdi
    call strlen                 ; call strlen( t_str )
    pop rdi                     ; restore rdi
                                ; in rax is length of t_str
    mov rcx, rdi                ; first character of t_str
    mov rdx, rcx
    add rdx, rax
    dec rdx                     ; last character of t_str
.back:
    cmp rcx, rdx                ; while ( rcx < rdx )
    jae .end
    mov al, [ rcx ]             ; sel. of first and last char
    mov ah, [ rdx ]
    mov [ rcx ], ah             ; store back sel. chars
    mov [ rdx ], al
    inc rcx                     ; move to the right
    dec rdx                     ; move to the lift
    jmp .back
.end:
    mov rax, rdi                ; return value

    leave
    ret

;***************************************************************************
    ;char *int2str( int t_number, char *t_str );

    global int2str
int2str:
    enter 0,0

    mov rax, rdi                ; t_number
    mov rcx, 10                 ; l_base of number system
    mov rdi, rsi                ; part of str. for mirror
    push rsi                    ; save t_str

    cmp rax, 0                  ; branches (jumps) for < > = 0
    jg .positive
    jl .negative
    mov [ rsi ], word '0'       ; add to end of t_str "0\0"
    jmp .ret                    ; all is done
.negative:
    mov [ rsi ], byte '-'       ; sign at beggining of t_str
    inc rdi                     ; skip sign
    neg rax                     ; turn sign
.back:
    inc rsi                     ; t_str++
.positive:
    test rax, rax               ; while ( rax )
    je .end
    mov rdx, 0  
    div rcx                     ; rax /= l_base
    add dl, '0'                 ; remainder += '0'
    mov [ rsi ], dl             ; *t_str = remainder
    jmp .back
.end:
    mov [ rsi ], byte 0         ; *t_str = 0
                                ; rdi is t_str for mirror
    call strmirror
.ret:
    pop rax                     ; return value

    leave
    ret

;***************************************************************************
    ;long strlength2( char *t_str );

    global strlength2
strlength2:
    enter 0,0

    mov ax, ds
    mov es, ax                  ; es = ds
    mov rcx, -1                 ; rcx = MAX
    mov al, 0                   ; searched character '\0'

    repne scasb                 ; searching t_str (rdi)

    inc rcx                     ; length without '\0'
    not rcx                     ; turn sign
    mov rax, rcx                ; string length

    leave
    ret

;***************************************************************************
    ;char *strnospaces( char *t_str );

    global strnospaces
strnospaces:
    enter 0,0

    mov rsi, rdi                ; rsi = t_str (rdi)
    mov rdx, rdi                ; save rdi
    mov ax, ds
    mov es, ax                  ; es = ds
    ; cld                       ; not necessary, DF je 0
.back:
    lodsb                       ; al = [ rsi++ ]
    test al, al                 
    jz .end                     ; end of string
    cmp al, ' '
    je .back                    ; skip space
    stosb                       ; [ rdi++ ] = al
    jmp .back
.end:
    stosb                       ; [ rdi ] = '\0'
    mov rax, rdx                ; return value

    leave
    ret

;***************************************************************************



