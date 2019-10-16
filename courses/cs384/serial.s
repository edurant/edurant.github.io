; Dr. Eric Durant <durant@msoe.edu>
; Tuesday 1/24/2006 8:16PM
; Fox11 Serial Demo Program
; $Id: serial.s,v 1.2 2006/01/25 02:56:34 durant Exp durant $

; Set HC11 SCI on Fox11 to 300 baud and echo a repeating series of ASCII
;    characters as fast as possible.
; Binary count on LEDs incrementing every 1/4 s
; Received characters are sent directly to LEDs in binary (visible for up to 1/4 s)

; Building...
; as -o serial.o serial.s
; ld -T ../fox11w.x -o serial.elf serial.o
; objdump -d -t serial.elf > serial.rst
; objcopy -O srec serial.elf serial.s19

baud  = 0x102b
sccr2 = 0x102d
scsr  = 0x102e
scdr  = 0x102f

sci_vec = 0xffd6

fox11_portb = 0x1404

; Define the range of characters to be transmitted
firstchar = ' ; space, first printable ASCII character
lastchar = '~ ; tilde, last printable ASCII character

; Question: If we only send a-z, is a non-detectable framing error possible?  Justify your response.
; Hint: Look at an ASCII table.  Are there any bits that all the characters a-z have in common?

        .section .text
        .global _start
_start: sei
        lds     #_stack

        ; set up SCI vector
        ldd     #sci_isr
        std     sci_vec

        ldaa    #0b0110101 ; 9600 baud with divider = 300 baud (given 8 MHz crystal)
        staa    baud       ; 0b 00 <SCP2=11=9600 baud> 0 <SCR3=101=divide by 2<<5=32>

        ldaa    #0b10101100 ; enable TIE/RIE/TE/RE
        staa    sccr2

        cli

        ; Binary count on LEDs every 1/4 s, may be overwritten by receive interrupt
        clra
0:      staa    fox11_portb
        inca
        bsr     wait
        bra     0b

        .section .data
lastsent:
        .byte firstchar-1

        .section .text
; We should really handle RDRF first.  Why?
sci_isr:ldab    scsr
        bpl     2f ; branch if TDRE not set
        ; TDRE was set, so we'll send the next character
        ldaa    lastsent
        inca
        staa    scdr    ; clears TDRE
        cmpa    #lastchar
        bne     1f
        ldaa    #firstchar-1
1:      staa    lastsent

2:      bitb    #0b00100000 ; RDRF
        beq     3f      ; branch if RDRF == 0
        ldaa    scdr    ; clears RDRF
        staa    fox11_portb

3:      ; handle other SCI interrupt sources, if desired

        rti

;;;;;;;;;;;; Timing Subroutines ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wait:   psha                ; save A
        tpa                 ; save condition codes
        psha                ; "
        pshx                ; save X
        ldx     #250        ; wait 250 milliseconds
1:      bsr     wait1ms     ; local label
        dex
        bne     1b
        pulx                ; restore X
        pula                ; restore condition codes
        tap                 ; "
        pula                ; restore a
        rts

wait1ms: psha                ; 1 ms wait
        tpa
        psha
        pshx
        ldx     #200
2:      dex
        nop
        nop
        bne     2b
        pulx
        pula
        tap
        pula
        rts
