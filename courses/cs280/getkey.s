; keypad routine for the FOX11 Rev. C - Rev. F boards
; with Wytec Phantom Monitor
; Written By Wayne Chu
; Wrapped into "getkey" subroutine and changed key up/down logic on 3/26-27/2006 by Dr. Durant <durant@msoe.edu>
;
; Function: Get a key from the keypad and return its value in accumulator B (0x00 through 0x0F).
; Minimal debouncing is done -- a key must detected in two, successive 10 ms samples in order to be counted.
;
; Instructions:
; Connect your 4x4 keypad to keypad header J6.
; Call init_keypad once to configure the HC11 to communicate with the keypad.
; Call getkey whenever you need a key value.  This is a blocking function (it won't return until the user presses a key).
;
; The following signal definitions apply to Wytec 4X4 membrane keypad:

; PD2 connects COL0 of the keypad via pin 1 of the 8-pin keypad header J6
; PD3 connects COL1 of the keypad via pin 2 of the 8-pin keypad header J6
; PD4 connects COL2 of the keypad via pin 3 of the 8-pin keypad header J6
; PD5 connects COL3 of the keypad via pin 4 of the 8-pin keypad header J6

; PE0 connects ROW0 of the keypad via pin 5 of the 8-pin keypad header J6
; PE1 connects ROW1 of the keypad via pin 6 of the 8-pin keypad header J6
; PE2 connects ROW2 of the keypad via pin 7 of the 8-pin keypad header J6
; PE3 connects ROW3 of the keypad via pin 8 of the 8-pin keypad header J6

; PE0-PE3 have a 100 kOhm pull-up resistor in each line.

REGBLK          =       0x1000
offset_portd    =       8
offset_ddrd     =       9
offset_porte    =       0x0a

TEN_MS          =       2500    ; 2500 x 8 cycles = 20,000 cycles = 10 ms

.section .bss
keytemp:    .space  1    ; reserve 1 byte of storage for getkey's use

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.section .text

init_keypad:    ; Configure HC11's PORTD for Fox11 keypad (initial value, and I/O direction for PD0)
        pshx
        psha

        ldx     #REGBLK
        ldaa    #0b11111111
        staa    offset_portd,x
        ldaa    #0b11111110     ; 0 =input, 1 = output -- PD0=input
        staa    offset_ddrd,x

        pula
        pulx
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.section .text

getkey: ; Input: none
        ; Output: pressed key (0x00 - 0x0F) in B

        ; preserve A and X; Y is preserved by called subroutines
        psha
        pshx

        ; wait for key up (assumption: the user program runs so fast that the previous key will still be depressed by the time this is called again)
0:      bsr     keybrd
        bcs     0b              ; key still down, so continue waiting

        ; wait for key down
1:      bsr     keybrd          ; is a key down?
        bcc     1b              ; no key down, so continue to check

        ; key just depressed, so wait and make sure the signal is good
        bsr     delay_10ms
        bsr     keybrd
        bcc     1b              ; false alarm, so start waiting for key down again

        ; the signal is good, so return the key code
        pulx
        pula

        rts                     ; key still down, so return key value (0x00-0x0F) in accumulator B

; keypad scan for Wytec 4X4 membrane keypad
; at exit:  if a key is down, carry bit = 1 and accumulator b holds the key number
;           if no key is down carry bit = 0

keybrd: ldx     #REGBLK
        ldab    #3
        ldaa    #0b11011111     ; starting with pd5 is low
        staa    keytemp
0:      staa    offset_portd,x
        nop                     ; add delay before checking key down
        nop
        nop
        nop
        ldaa    offset_porte,x
        anda    #0x0f           ; needs PE0-PE3 only
        cmpa    #0x0f
        bne     keyin           ; key input detected
        decb
        cmpb    #0xff           ; after 4 tests, accumulator B will be 0xff
        beq     no_keyin
        ror     keytemp         ; check next column
        ldaa    keytemp
        bra     0b              ; next row

no_keyin:
        clc
        rts                     ; no key input

keyin:  rora
        bcc     2f
        addb    #4
        bra     keyin
2:      sec
        rts

delay_10ms:
        pshy
        ldy     #TEN_MS
1:      dey                     ; 4 cycles
        nop                     ; 1 cycle
        bne     1b              ; 3 cycles
        puly
        rts
