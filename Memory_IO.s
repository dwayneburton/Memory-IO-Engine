;------------------------------------------------------------------------------
; Purpose: ARM Assembly using register operations
;------------------------------------------------------------------------------
        THUMB                       ; Use the Thumb instruction set
        AREA    My_code, CODE, READONLY
        EXPORT  __MAIN              ; Entry label exported for linker
        ENTRY

__MAIN                              ; Do not rename - matches startup_LPC1768.s

;------------------------------------------------------------------------------
; Section 1: Store a 32-bit value to memory and inspect endianness
;------------------------------------------------------------------------------
        MOV     R0, #0x5678         ; Load lower 16 bits of R0 with 0x5678
        MOVT    R0, #0x1234         ; Load upper 16 bits of R0 with 0x1234
        MOV     R1, #0x0            ; Clear R1
        MOVT    R1, #0x1000         ; Set R1 = 0x10000000 (target memory address)
        STR     R0, [R1]            ; Store R0 into memory at 0x10000000

;------------------------------------------------------------------------------
; Section 2: Load values into general-purpose registers
;------------------------------------------------------------------------------
        MOV     R0, #0x123          ; Load 0x123 into R0
        MOV     R1, #0x456          ; Load 0x456 into R1
        MOV     R2, #0x789          ; Load 0x789 into R2
        MOV     R3, #0xABC          ; Load 0xABC into R3
        MOV     R4, #0xDEF          ; Load 0xDEF into R4
        MOV     R5, #0x0            ; Clear R5

;------------------------------------------------------------------------------
; Section 3: Swap values between R0 and R1 using R5 as temporary register
;------------------------------------------------------------------------------
        MOV     R5, R0              ; Copy R0 into R5
        MOV     R0, R1              ; Copy R1 into R0
        MOV     R1, R5              ; Copy R5 into R1 (original R0)

;------------------------------------------------------------------------------
; Section 4: Add R0 through R4 and store the result in R5
;------------------------------------------------------------------------------
        ADD     R5, R0, R1          ; R5 = R0 + R1
        ADD     R5, R2              ; R5 += R2
        ADD     R5, R3              ; R5 += R3
        ADD     R5, R4              ; R5 += R4

;------------------------------------------------------------------------------
; Section 5: Infinite loop to halt the program
;------------------------------------------------------------------------------
LOOP    B       LOOP                ; Loop forever (halts execution)

        END                         ; End of program