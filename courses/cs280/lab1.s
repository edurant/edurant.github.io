; $Id: lab1.s,v 1.6 2005/03/22 02:50:37 durant Exp durant $
; CS-280 Lab 1
; Written by Dr. E. Durant <durant@msoe.edu>
; Purpose: Count the number of characters in a null-terminated string,
;          up to some maximum length
; Original version: 1 March 2002
; Updated for GNU as: 28 February 2003, 7 March 2004
; Updated comments for Fox11: 6 March 2005

; This is similar to the strnlen function, which is a GNU extension to
; the string module from the standard C libraries.
;       size_t strnlen (const char *s, size_t maxlen);
; Our size_t represents a 16-bit data type.

; Using GNU Development Chain for 68HC11:
; Assemble with   : as -o lab1.o lab1.s
; Link with       : ld -T ../fox11w.x -o lab1.elf lab1.o
; Convert to S19  : objcopy -O srec lab1.elf lab1.s19
; Create a listing: objdump -d lab1.elf > lab1.rst

; Set up a global symbol for the maximum length
MAXLEN  =       128

;;;;;;;;;; Data (read/write, RAM) ;;;;;;;;;;
        .section   .bss
; bss = uninitialized data -- maps data section (starting at 0xF000) per fox11w.x
length: .short  1               ; reserve a 16-bit word for the length (uninitialized)

;;;;;;;;;; Data (read-only, ROMable) ;;;;;;;;;;
        .section    .rodata
; read-only data, this is put in the text section, after executable code
; (Why do you think this is in a separate section?  Check with your
; instructor to see if you have the right answer.)
string: .asciz  "Testing... one... two... three..."
; .asciz generates an ASCIIZ string (a null-terminated ASCII string).

;;;;;;;;;; Executable code, main entry point ;;;;;;;;;;
        .section    .text
; .text is used for executable code, text begins at 0x8400 for the for the Fox11 board per fox11w.x
        .global _start  ; exported entry point expected by GNU as
_start:
        lds     #_stack ; Initialize stack pointer
; fox11w.x defines _stack to be 0xFFBF.  A stack of bytes that the program
; can use during calculations and function calls will work its way down
; in memory from here.  Note that data declared by your program (such as
; in .bss above) starts at 0xF000 (per the .x file) and works its way
; up in memory.  If the combined size of the  data and stack exceed
; 0x0FC0 bytes (just under 4 kB), they will collide.

; Set up string pointer and counter
        ldx     #string ; pointer to string
        ldy     #0      ; count of non-null characters

; Advance through string, calculating length, and minding MAXLEN.
1:      tst     0,x     ; Have we found a null in the string?
        beq     2f      ; If so, we're almost done -- go to final code (2f = forward to 2).
        iny             ; Count the character we just saw.
        cpy     #MAXLEN ; Have we reached the maximum length?
        beq     2f      ; If so, we're almost done -- go to final code.
        inx             ; Otherwise, point to the next character...

        bra     1b      ; ...and repeat. (1b = backward to 1)

; Finally, store the length in memory and come to a stop (sort of).
2:      sty     length
        bra     .       ; When used in an instruction operand, "." is
; the address at which the instruction begins.  This creates an endless
; loop and is a simple way to stop the processor from doing anything
; interesting (unless there are interrupts...).
