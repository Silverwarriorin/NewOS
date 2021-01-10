;;Program start at 0000h

org 0800h
jp cold_start

;;
;;Memory Definitions
;;

monitor:  equ	0xdbff

;;
;;Routine to print a character
;;

print_char:  ld c,a 
print_char_loop:  in a,(3)

    and 001h
    jp z,print_char_loop
    ld a,c
    out (2),a 
    ret

;;
;;Routine to print a string
;;

print_string:  in a,(3)

    and 001h
    jp z,print_string
    ld a,(hl)
    and a 
    ret z 
    out (2),a 
    inc hl
    jp print_string

;;
;;Press any key routine
;;

press_enter:  in a,(3)

    and 002h
    jp z,press_enter
    in a,(2)
    cp 00dh
    ret z

;;
;;Clear routines
;;

clear_display:  ld b,019h    
clear_display_loop:  

    call newline    
    djnz clear_display_loop
    ret

;;
;;Routines to print multiple spaces NOTE: load a value into the b register prior to calling
;;

jump_spaces:  ld a,020h 
jump_spaces_loop:  

    call print_char
    djnz jump_spaces_loop
    ret

;;
;;Write Newline
;;

newline:  ld a,00ah

    call print_char

;;
;;All the startup message routines
;;

startup_messages:  ld hl,Top_Bar_Color

    call print_string
    ld b,050h
    call jump_spaces

    call newline

    ld hl,Main_Panel_Color
    call print_string
    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,028h
    call jump_spaces
    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,028h
    call jump_spaces
    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,00ah
    call jump_spaces

    ld hl,Welcome_Message
    call print_string
    ld b,00ah
    call jump_spaces

    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,028h
    call jump_spaces

    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,028h
    call jump_spaces

    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,00ah
    call jump_spaces

    ld hl,Please_Enter
    call print_string
    ld b,00ah
    call jump_spaces

    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,028h
    call jump_spaces

    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,014h
    call jump_spaces
    ld hl,Window_Color
    call print_string
    ld b,028h
    call jump_spaces

    ld hl,Main_Panel_Color
    call print_string
    ld b,014h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    call newline

    ld b,050h
    call jump_spaces

    ret

    

    




















;;
;; Colors
;;

Top_Bar_Color:  defm "\033[48;5;250m",0
Main_Panel_Color:  defm "\033[48;5;255m",0
Window_Color:  defm "\033[48;5;7m",0
Text:  defm "\033[38;5;0m",0

;;
;;Messages
;;

Welcome_Message: defm "Welcome to my new OS",0
Please_Enter: defm "[PLEASE PRESS ENTER]",0
Tada: defm "Tada",0

;;
;; Stuff to execute
;;

cold_start:  ld sp,monitor

    ld hl,Text
    call print_string
    call startup_messages
    call press_enter
    call clear_display
    ld hl,Tada
    call print_string
    





