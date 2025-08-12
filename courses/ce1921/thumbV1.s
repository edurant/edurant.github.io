; Thumb translation Dr. Meier's DE10-Lite ARM test program
; Dr. Durant 2018-05-17 CE1921

; The 16-bit Thumb instructions generally set the status bits.
; We write the instructions as movs/subs/adds/ands etc., which allows the online
; shell-storm assembler to correctly assemble them. If we omit the S,
; the assembler creates 32b Thumb-2 instructions (which are neither ARM nor Thumb).
; The ARM7 TDMI documentation provided in class says that you can just write AND instead of ANDS,
; etc., but this applies to a pure Thumb or ARM+Thumb architecture assembler,
; such as ARMv4t, ARMv6-M, ARMv7-R, or ARMv7-M.
; It does not apply to (most or all?) Thumb-2-type (e.g., ARMv6T2) architecture assemblers.

.equ    SLIDE,0x000000f4
.equ    SEG7,0x000000fc
.equ    LED,0x000000f8

main:   MOVS R4,#4     ; R4 = memory address           2404
        MOVS R7,#0     ; temp = 0                      2700
        STR R7,[R4]    ; MEM[4] = 0 : init memory      6027
        MOVS R7,#SLIDE ; address of sliders            27f4 ; 8 LSB is 8b immediate
        LDR R6,[R7]    ; i = n                         683e
        MOVS R5,#0     ; sum = 0                       2500
        CMP R6,#0      ; i=0?                          2e00
        BEQ print      ; if yes branch to print        d00a ; inst. count rel. to PC+4 (not +2)
loop:   ADDS R5,R6     ; sum = sum + i                 1975
        SUBS R6,#1     ; i = i - 1                     3e01
        CMP R6,#0      ;                               2e00
        BNE loop       ;                               d1fa
if:     MOVS R2,#0     ; creating FFFFFFE0             2200
        SUBS R2,#32    ; 0 - 32 = -32 = FFFFFFE0       3a20
        ANDS R2,R5     ;                               402a
        CMP R2,#0      ;                               2a00
        BEQ else       ; if (R5 > 32) MEM[4] = 1       d000
        MOVS R2,#1     ; set the 1                     2201
else:   STR R2,[R4]    ; memory[4] = either 1 or 0     6022
print:  MOVS R7,#SEG7  ; seg7 data reg address         27fc
        STR R5,[R7]    ; seg7 = sum                    603d
        MOVS R7,#LED   ; LED reg address               27f8
        LDR R3,[R4]    ; get stored memory value back  6823
        STR R3,[R7]    ; leds = mem[4]: LED0 on if >32 603b
done:   B done         ;                               e7fe

; Assembly/disassembly examples for Thumb:
; MOVS R4,#4: 001 00 100 0000_0100 = 2404
; ADDS R5,R6: 00011 0 0 101 110 101 = 1975, format 2 allows 3 operands
;             00011 0 0 101 101 110 = 196e, ...other source order
;             010001 00 00 110 101 = 4435, format 5 also works
; Format 2 is 3-operand add/subtract, format 5 is 2-operand more general ALU ops with high reg support.
; Formats 2 and 5 BOTH work for this ADDS instruction!
; Some assemblers will use MOV/ADD, but it is understood that these Thumb instructions set the flag bits!
; Thumb does not have versions of these instructions that do NOT set the flag bits.

; 3E01: format 3: 001 11(op=subs) 110(Rd) 00000001(offset) -> subs r6,#1
; D00A: format 16: conditional branch: 1101 0000(beq) 0x0A = offset (in int16[]) relative to PC+4

; http://shell-storm.org/online/Online-Assembler-and-Disassembler/

; shell-storm puts the machine code in the C language's (8-bit) character array format.
; To use it, you'll select big endian for ease of reading. It will give you results like:
; "\x24\x04\x27\x00" The \x indicates an 8-bit character specified in hexadecimal,
; so the instructions are 2404 2700.

; The shell-storm assembler actually gives "eb150506" for adds r5,r6.
; This is disassembled as the Thumb-2 instruction adds.w r5,r5,r6 by onlinedissassembler.
; This is NOT an ARM instruction, even though it looks similar (ARM add r5,r5,r6 is 0xE0855006).
; But onlinedissassembler does confirm that 0x1975 is just plain adds r5,r6.
; Shell-storm doesn't recognize the more efficient Thumb encoding in this case and instead uses Thumb-2.
