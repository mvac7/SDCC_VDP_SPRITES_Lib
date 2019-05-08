;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module VDP_SPRITES
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPRITEYBUFF
	.globl _PUTSPRITE
	.globl _SetSpritePattern
	.globl _SetSpriteColor
	.globl _SetSpritePosition
	.globl _SetSpriteVisible
	.globl _SetEarlyClock
	.globl _UnsetEarlyClock
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_SPRITEYBUFF::
	.ds 32
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src\VDP_SPRITES.c:58: void PUTSPRITE(char plane, char x, char y, char color, char pattern)
;	---------------------------------
; Function PUTSPRITE
; ---------------------------------
_PUTSPRITE::
;src\VDP_SPRITES.c:101: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX) ;num sprite plane
	call	GetSPRattrVADDR
	ld	A,6(IX) ;y
	call	WriteByte2VRAM ;WRTVRM
	inc	HL
	ld	A,5(IX) ;x
	call	WriteByte2VRAM ;WRTVRM
	inc	HL
	ld	E,8(IX)
	call	setSpritePattern ;pattern
	inc	HL
	ld	A,7(IX) ;color
	call	WriteByte2VRAM ;WRTVRM
	pop	IX
	ret
;	------------------------------------------------------------------------------
;	Input : A - Sprite number
;	Output : HL - For the address
;	same as MSX BIOS CALATR:
	GetSPRattrVADDR:
	SLA	A ;*2
	SLA	A ;*2
	ld	E,A
	ld	D,#0
	ld	HL,#0x1B00
	add	HL,DE
;ret
	ret
;src\VDP_SPRITES.c:113: void SetSpritePattern(char plane, char pattern)
;	---------------------------------
; Function SetSpritePattern
; ---------------------------------
_SetSpritePattern::
;src\VDP_SPRITES.c:153: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(ix) ;num sprite plane
	call	GetSPRattrVADDR ;get vram address
	inc	HL
	inc	HL
	ld	E,5(ix) ;number of pattern to assign
	call	setSpritePattern
	pop	IX
	ret
;	set sprite pattern number
;	Multiply * 4 when its a 16x16 sprite.
;	E - Sprite Number
	setSpritePattern:
	ld	A,(#0xF3DF +1) ; --- read vdp(1) from mem
	bit	1,A ;Sprite size; 1=16x16
	jr	Z,WRTPAT
;if	spritesize = 16x16 then A*4
	SLA	E
	SLA	E ;multiplica x4
	WRTPAT:
	LD	A,E
	call	WriteByte2VRAM ;WRTVRM
;ret
	ret
;src\VDP_SPRITES.c:165: void SetSpriteColor(char plane, char color)
;	---------------------------------
; Function SetSpriteColor
; ---------------------------------
_SetSpriteColor::
;src\VDP_SPRITES.c:185: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX) ;num sprite plane
	call	GetSPRattrVADDR
	inc	HL
	inc	HL
	inc	HL
	ld	A,5(IX) ;color
	call	WriteByte2VRAM ;WRTVRM
	pop	IX
	ret
;src\VDP_SPRITES.c:198: void SetSpritePosition(char plane, char x, char y)
;	---------------------------------
; Function SetSpritePosition
; ---------------------------------
_SetSpritePosition::
;src\VDP_SPRITES.c:217: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(ix) ;num sprite
	call	GetSPRattrVADDR
	ld	A,6(ix) ;y
	call	WriteByte2VRAM ;WRTVRM
	inc	HL
	ld	A,5(ix) ;x
	call	WriteByte2VRAM ;WRTVRM
	pop	IX
	ret
;src\VDP_SPRITES.c:229: void SetSpriteVisible(char plane, boolean state)
;	---------------------------------
; Function SetSpriteVisible
; ---------------------------------
_SetSpriteVisible::
;src\VDP_SPRITES.c:271: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(ix) ;num sprite
	ld	IY,#_SPRITEYBUFF
	ld	D,#0
	ld	E,A
	ADD	IY,DE
	call	GetSPRattrVADDR
	ld	A,5(ix) ;state
	or	A ;0 = off
	jr	Z,SPRITEOFF
;sprite	ON
	ld	A,(IY)
	call	WriteByte2VRAM ;WRTVRM
	pop	IX
	ret
;sprite	OFF
	SPRITEOFF:
	call	ReadByteFromVRAM ;RDVRM
	cp	#0xD1 ; concealment of the sprite outside the limits of the screen in TMS9918A modes
	jr	Z,ENDOFF ;if not visible then Dont overwrite.
	ld	(IY),A
	ld	A,#0xD1 ; concealment of the sprite outside the limits of the screen in TMS9918A modes
	call	WriteByte2VRAM ;WRTVRM
	ENDOFF:
	pop	IX
	ret
;src\VDP_SPRITES.c:283: void SetEarlyClock(char plane)
;	---------------------------------
; Function SetEarlyClock
; ---------------------------------
_SetEarlyClock::
;src\VDP_SPRITES.c:305: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX)
	call	GetSPRattrVADDR
	inc	HL
	inc	HL
	inc	HL
	push	HL
	call	ReadByteFromVRAM ;RDVRM
	OR	#128
	pop	HL
	call	WriteByte2VRAM ;WRTVRM VPOKE
	pop	IX
	ret
;src\VDP_SPRITES.c:316: void UnsetEarlyClock(char plane)
;	---------------------------------
; Function UnsetEarlyClock
; ---------------------------------
_UnsetEarlyClock::
;src\VDP_SPRITES.c:337: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX)
	call	GetSPRattrVADDR
	inc	HL
	inc	HL
	inc	HL
	call	ReadByteFromVRAM ;RDVRM
	and	#127
	call	WriteByte2VRAM ;WRTVRM
	pop	IX
;ret
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
