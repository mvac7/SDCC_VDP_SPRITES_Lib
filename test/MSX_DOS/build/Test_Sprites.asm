;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module Test_Sprites
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _UnsetEarlyClock
	.globl _SetEarlyClock
	.globl _SetSpriteVisible
	.globl _SetSpritePosition
	.globl _SetSpriteColor
	.globl _SetSpritePattern
	.globl _PUTSPRITE
	.globl _CopyToVRAM
	.globl _VPOKE
	.globl _COLOR
	.globl _ClearSprites
	.globl _SetSpritesZoom
	.globl _SetSpritesSize
	.globl __LineLength
	.globl _SIN
	.globl _SPRITE_DATA
	.globl _sprcol
	.globl _text02
	.globl _text01
	.globl _System
	.globl _SCREEN0
	.globl _SCREEN1
	.globl _INKEY
	.globl _WAIT
	.globl _VPRINT
	.globl _VPOKEARRAY
	.globl _LOCATE
	.globl _PRINT
	.globl _PEEK
	.globl _PEEKW
	.globl _testSPRITES
	.globl _setSpritesPatterns
	.globl _showSprites
	.globl _testSpriteVisible
	.globl _testSpritePattern
	.globl _testSpriteColor
	.globl _testSpritePosition
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__LineLength::
	.ds 1
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
;src\Test_Sprites.c:138: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src\Test_Sprites.c:145: colorInk=PEEK(FORCLR);
	ld	hl,#0xf3e9
	push	hl
	call	_PEEK
	pop	af
	ld	-1 (ix),l
;src\Test_Sprites.c:146: colorBG=PEEK(BAKCLR);
	ld	hl,#0xf3ea
	push	hl
	call	_PEEK
	pop	af
	ld	-2 (ix),l
;src\Test_Sprites.c:147: colorBDR=PEEK(BDRCLR);
	ld	hl,#0xf3eb
	push	hl
	call	_PEEK
	pop	af
	ld	-3 (ix),l
;src\Test_Sprites.c:148: scrcolumns=PEEK(LINLEN);
	ld	hl,#0xf3b0
	push	hl
	call	_PEEK
	pop	af
	ld	-4 (ix),l
;src\Test_Sprites.c:150: PRINT(text01); 
	ld	hl,#_text01
	push	hl
	call	_PRINT
;src\Test_Sprites.c:151: PRINT("\n\r");
	ld	hl, #___str_0
	ex	(sp),hl
	call	_PRINT
;src\Test_Sprites.c:152: PRINT(text02);
	ld	hl, #_text02
	ex	(sp),hl
	call	_PRINT
	pop	af
;src\Test_Sprites.c:153: INKEY();
	call	_INKEY
;src\Test_Sprites.c:156: SCREEN1();
	call	_SCREEN1
;src\Test_Sprites.c:158: VPRINT(0,0,"screen 1");  
	ld	hl,#___str_1
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:160: _LineLength=4; 
	ld	hl,#__LineLength + 0
	ld	(hl), #0x04
;src\Test_Sprites.c:161: testSPRITES();
	call	_testSPRITES
;src\Test_Sprites.c:186: COLOR(colorInk,colorBG,colorBDR);
	ld	h,-3 (ix)
	ld	l,-2 (ix)
	push	hl
	ld	a,-1 (ix)
	push	af
	inc	sp
	call	_COLOR
	pop	af
	inc	sp
;src\Test_Sprites.c:189: if(scrcolumns<33) SCREEN1();
	ld	a,-4 (ix)
	sub	a, #0x21
	jr	NC,00102$
	call	_SCREEN1
	jr	00103$
00102$:
;src\Test_Sprites.c:190: else SCREEN0();
	call	_SCREEN0
00103$:
;src\Test_Sprites.c:193: PRINT("End of the test...");
	ld	hl,#___str_2
	push	hl
	call	_PRINT
	pop	af
;src\Test_Sprites.c:195: System(_TERM0); 
	xor	a, a
	push	af
	inc	sp
	call	_System
	ld	sp,ix
	pop	ix
	ret
_text01:
	.ascii "Test SDCC SPRITES Lib v1.3.1"
	.db 0x00
_text02:
	.ascii "Press any key"
	.db 0x00
_sprcol:
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0e	; 14
_SPRITE_DATA:
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0xa5	; 165
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0x99	; 153
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0xfe	; 254
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3d	; 61
	.db #0x3f	; 63
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0xef	; 239
	.db #0x6f	; 111	'o'
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x1d	; 29
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x86	; 134
	.db #0xde	; 222
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x1a	; 26
	.db #0x2e	; 46
	.db #0x6f	; 111	'o'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5b	; 91
	.db #0x5f	; 95
	.db #0x58	; 88	'X'
	.db #0x6f	; 111	'o'
	.db #0x2d	; 45
	.db #0x16	; 22
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xb8	; 184
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0x6a	; 106	'j'
	.db #0xea	; 234
	.db #0x6a	; 106	'j'
	.db #0xea	; 234
	.db #0x6a	; 106	'j'
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x4f	; 79	'O'
	.db #0xcf	; 207
	.db #0x4d	; 77	'M'
	.db #0x4f	; 79	'O'
	.db #0x2c	; 44
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xe2	; 226
	.db #0xe6	; 230
	.db #0xe2	; 226
	.db #0xa2	; 162
	.db #0xf4	; 244
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x6f	; 111	'o'
	.db #0x57	; 87	'W'
	.db #0x6e	; 110	'n'
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0xf4	; 244
	.db #0xea	; 234
	.db #0x76	; 118	'v'
	.db #0xbe	; 190
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7d	; 125
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x78	; 120	'x'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x3c	; 60
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x71	; 113	'q'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x71	; 113	'q'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xde	; 222
	.db #0x3e	; 62
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x05	; 5
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0x6f	; 111	'o'
	.db #0x57	; 87	'W'
	.db #0x6e	; 110	'n'
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0xf4	; 244
	.db #0xea	; 234
	.db #0x76	; 118	'v'
	.db #0xbe	; 190
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x60	; 96
_SIN:
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5b	; 91
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8d	; 141
	.db #0x8d	; 141
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8b	; 139
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x86	; 134
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x7d	; 125
	.db #0x7c	; 124
	.db #0x7b	; 123
	.db #0x79	; 121	'y'
	.db #0x78	; 120	'x'
	.db #0x77	; 119	'w'
	.db #0x76	; 118	'v'
	.db #0x74	; 116	't'
	.db #0x73	; 115	's'
	.db #0x72	; 114	'r'
	.db #0x70	; 112	'p'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6c	; 108	'l'
	.db #0x6b	; 107	'k'
	.db #0x69	; 105	'i'
	.db #0x68	; 104	'h'
	.db #0x66	; 102	'f'
	.db #0x65	; 101	'e'
	.db #0x63	; 99	'c'
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x5d	; 93
	.db #0x5c	; 92
	.db #0x5a	; 90	'Z'
	.db #0x59	; 89	'Y'
	.db #0x57	; 87	'W'
	.db #0x56	; 86	'V'
	.db #0x54	; 84	'T'
	.db #0x52	; 82	'R'
	.db #0x51	; 81	'Q'
	.db #0x4f	; 79	'O'
	.db #0x4e	; 78	'N'
	.db #0x4c	; 76	'L'
	.db #0x4a	; 74	'J'
	.db #0x49	; 73	'I'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x44	; 68	'D'
	.db #0x43	; 67	'C'
	.db #0x41	; 65	'A'
	.db #0x40	; 64
	.db #0x3e	; 62
	.db #0x3d	; 61
	.db #0x3b	; 59
	.db #0x3a	; 58
	.db #0x38	; 56	'8'
	.db #0x37	; 55	'7'
	.db #0x35	; 53	'5'
	.db #0x34	; 52	'4'
	.db #0x32	; 50	'2'
	.db #0x31	; 49	'1'
	.db #0x30	; 48	'0'
	.db #0x2e	; 46
	.db #0x2d	; 45
	.db #0x2c	; 44
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x22	; 34
	.db #0x21	; 33
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x45	; 69	'E'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x50	; 80	'P'
___str_0:
	.db 0x0a
	.db 0x0d
	.db 0x00
___str_1:
	.ascii "screen 1"
	.db 0x00
___str_2:
	.ascii "End of the test..."
	.db 0x00
;src\Test_Sprites.c:202: void System(char code)
;	---------------------------------
; Function System
; ---------------------------------
_System::
;src\Test_Sprites.c:214: __endasm; 
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	C,4(ix)
	call	0x0005
	pop	IX
	ret
;src\Test_Sprites.c:219: void SCREEN0()
;	---------------------------------
; Function SCREEN0
; ---------------------------------
_SCREEN0::
;src\Test_Sprites.c:235: __endasm;
	push	IX
	ld	A,(#0xF3B0)
	ld	(#0xF3AE),A ;copy columns seting with WIDTH to 0xF3AE system var
	ld	IX,#0x006C
	ld	IY,(0xFCC1 -1)
	call	0x001C
	ei
	pop	IX
	ret
;src\Test_Sprites.c:240: void SCREEN1()
;	---------------------------------
; Function SCREEN1
; ---------------------------------
_SCREEN1::
;src\Test_Sprites.c:256: __endasm;
	push	IX
	ld	A,(#0xF3B0) ;get a last value set with WIDTH function
	ld	(#0xF3AF),A ;set system variable
	ld	IX,#0x006F
	ld	IY,(0xFCC1 -1)
	call	0x001C
	ei
	pop	IX
	ret
;src\Test_Sprites.c:265: char INKEY(){
;	---------------------------------
; Function INKEY
; ---------------------------------
_INKEY::
;src\Test_Sprites.c:278: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
;call	0x009F
	ld	IX,#0x009F
	ld	IY,(#0xFCC1 -1)
	call	0x001C ;acces to MSX BIOS
	ld	L,A
	pop	IX
	ret
;src\Test_Sprites.c:285: void WAIT(uint cicles)
;	---------------------------------
; Function WAIT
; ---------------------------------
_WAIT::
;src\Test_Sprites.c:288: for(i=0;i<cicles;i++) HALT;
	ld	bc,#0x0000
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	ret	NC
	halt	
	inc	bc
	jr	00103$
;src\Test_Sprites.c:295: void VPRINT(byte column, byte line, char* text)
;	---------------------------------
; Function VPRINT
; ---------------------------------
_VPRINT::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\Test_Sprites.c:297: uint vaddr = BASE10 + (line*32)+column; // calcula la posicion en la VRAM
	ld	l,5 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc,#0x1800
	add	hl,bc
	ld	c,4 (ix)
	ld	b,#0x00
	add	hl,bc
;src\Test_Sprites.c:298: VPOKEARRAY(vaddr, text);
	ld	c,6 (ix)
	ld	b,7 (ix)
	push	bc
	push	hl
	call	_VPOKEARRAY
	pop	af
	pop	af
	pop	ix
	ret
;src\Test_Sprites.c:303: void VPOKEARRAY(uint vaddr, char* text)
;	---------------------------------
; Function VPOKEARRAY
; ---------------------------------
_VPOKEARRAY::
	push	ix
	ld	ix,#0
	add	ix,sp
;src\Test_Sprites.c:305: while(*(text)) VPOKE(vaddr++,*(text++));
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	e,4 (ix)
	ld	d,5 (ix)
00101$:
	ld	a,(bc)
	or	a, a
	jr	Z,00104$
	ld	h,a
	inc	bc
	push	de
	pop	iy
	inc	de
	push	bc
	push	de
	push	hl
	inc	sp
	push	iy
	call	_VPOKE
	pop	af
	inc	sp
	pop	de
	pop	bc
	jr	00101$
00104$:
	pop	ix
	ret
;src\Test_Sprites.c:316: void LOCATE(char x, char y)
;	---------------------------------
; Function LOCATE
; ---------------------------------
_LOCATE::
;src\Test_Sprites.c:337: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	A,4(IX) ;x
	inc	A ;incrementa las posiciones para que se situen correctamente en la pantalla
	ld	H,A
	ld	A,5(IX) ;y
	inc	A
	ld	L,A
;call	0x00C6
	ld	IX,#0x00C6
	ld	IY,(#0xFCC1 -1)
	call	0x001C ;acces to MSX BIOS
	pop	IX
	ret
;src\Test_Sprites.c:346: void PRINT(char* text)
;	---------------------------------
; Function PRINT
; ---------------------------------
_PRINT::
;src\Test_Sprites.c:371: __endasm; 
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(ix)
	ld	H,5(ix)
	nextCHAR:
	ld	A,(HL)
	or	A
	jr	Z,ENDnext
;call	0x00A2
	ld	IX,#0x00A2
	ld	IY,(#0xFCC1 -1)
	call	0x001C ;acces to MSX BIOS
	inc	HL
	jr	nextCHAR
	ENDnext:
	pop	IX
	ret
;src\Test_Sprites.c:376: char PEEK(uint address)
;	---------------------------------
; Function PEEK
; ---------------------------------
_PEEK::
;src\Test_Sprites.c:390: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(IX)
	ld	H,5(IX)
	ld	L,(HL)
	pop	IX
	ret
;src\Test_Sprites.c:395: uint PEEKW(uint address)
;	---------------------------------
; Function PEEKW
; ---------------------------------
_PEEKW::
;src\Test_Sprites.c:411: __endasm;
	push	IX
	ld	IX,#0
	add	IX,SP
	ld	L,4(ix)
	ld	H,5(ix)
	ld	E,(HL)
	inc	HL
	ld	D,(HL)
	ex	DE,HL
	pop	IX
	ret
;src\Test_Sprites.c:419: void testSPRITES()
;	---------------------------------
; Function testSPRITES
; ---------------------------------
_testSPRITES::
;src\Test_Sprites.c:423: setSpritesPatterns();
	call	_setSpritesPatterns
;src\Test_Sprites.c:425: VPRINT(0,posY++, "-----------------Basic Functions");
	ld	hl,#___str_5
	push	hl
	ld	hl,#0x0200
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:429: VPRINT(0,posY++, "SetSpritesSize(0) SPRITES 8x8");
	ld	hl, #___str_6
	ex	(sp),hl
	ld	hl,#0x0300
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:430: SetSpritesSize(0);
	xor	a, a
	push	af
	inc	sp
	call	_SetSpritesSize
	inc	sp
;src\Test_Sprites.c:431: SetSpritesZoom(false);  
	xor	a, a
	push	af
	inc	sp
	call	_SetSpritesZoom
	inc	sp
;src\Test_Sprites.c:432: showSprites(0);
	xor	a, a
	push	af
	inc	sp
	call	_showSprites
	inc	sp
;src\Test_Sprites.c:433: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:437: VPRINT(0,posY++, "SetSpritesSize(1) SPRITES 16x16");
	ld	hl, #___str_7
	ex	(sp),hl
	ld	hl,#0x0400
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:438: SetSpritesSize(1);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	_SetSpritesSize
	inc	sp
;src\Test_Sprites.c:439: showSprites(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_showSprites
	inc	sp
;src\Test_Sprites.c:440: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:444: VPRINT(0,posY++, "SetSpritesZoom(true) SPRITES x2");
	ld	hl, #___str_8
	ex	(sp),hl
	ld	hl,#0x0500
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:445: SetSpritesZoom(true);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	_SetSpritesZoom
	inc	sp
;src\Test_Sprites.c:446: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:449: VPRINT(0,posY++, "ClearSprites()");
	ld	hl, #___str_9
	ex	(sp),hl
	ld	hl,#0x0600
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:450: ClearSprites();
	call	_ClearSprites
;src\Test_Sprites.c:451: WAIT(100);
	ld	hl,#0x0064
	push	hl
	call	_WAIT
	pop	af
;src\Test_Sprites.c:453: setSpritesPatterns();
	call	_setSpritesPatterns
;src\Test_Sprites.c:454: VPRINT(0,posY++, "PUTSPRITE(plane,x,y,color,nSPR)");
	ld	hl,#___str_10
	push	hl
	ld	hl,#0x0700
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:455: showSprites(2);                                                                           
	ld	h,#0x02
	ex	(sp),hl
	inc	sp
	call	_showSprites
	inc	sp
;src\Test_Sprites.c:457: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:459: VPRINT(0,posY++, "--------------Extended Functions");
	ld	hl, #___str_11
	ex	(sp),hl
	ld	hl,#0x0900
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:461: VPRINT(0,posY++, "SetSpriteVisible(plane,state)");
	ld	hl, #___str_12
	ex	(sp),hl
	ld	hl,#0x0a00
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:462: testSpriteVisible();
	call	_testSpriteVisible
;src\Test_Sprites.c:464: VPRINT(0,posY++, "SetSpritePattern(plane,nSPR)"); 
	ld	hl,#___str_13
	push	hl
	ld	hl,#0x0b00
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:465: testSpritePattern();
	call	_testSpritePattern
;src\Test_Sprites.c:467: VPRINT(0,posY++, "SetSpriteColor(plane,color)"); 
	ld	hl,#___str_14
	push	hl
	ld	hl,#0x0c00
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:468: testSpriteColor();
	call	_testSpriteColor
;src\Test_Sprites.c:470: VPRINT(0,posY++, "SetSpritePosition(plane,x,y)");
	ld	hl,#___str_15
	push	hl
	ld	hl,#0x0d00
	push	hl
	call	_VPRINT
	pop	af
	pop	af
;src\Test_Sprites.c:471: testSpritePosition();
	call	_testSpritePosition
;src\Test_Sprites.c:473: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:475: VPRINT(0,posY++, "SetEarlyClock(plane)");
	ld	hl, #___str_16
	ex	(sp),hl
	ld	hl,#0x0e00
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:476: SetEarlyClock(7);
	ld	h,#0x07
	ex	(sp),hl
	inc	sp
	call	_SetEarlyClock
	inc	sp
;src\Test_Sprites.c:477: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:479: VPRINT(0,posY++, "UnsetEarlyClock(plane)");
	ld	hl, #___str_17
	ex	(sp),hl
	ld	hl,#0x0f00
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:480: UnsetEarlyClock(7);
	ld	h,#0x07
	ex	(sp),hl
	inc	sp
	call	_UnsetEarlyClock
	inc	sp
;src\Test_Sprites.c:481: WAIT(50);
	ld	hl,#0x0032
	push	hl
	call	_WAIT
;src\Test_Sprites.c:484: VPRINT(0,posY, text02);
	ld	hl, #_text02
	ex	(sp),hl
	ld	hl,#0x1300
	push	hl
	call	_VPRINT
	pop	af
;src\Test_Sprites.c:485: LOCATE(14,posY);
	ld	hl, #0x130e
	ex	(sp),hl
	call	_LOCATE
	pop	af
;src\Test_Sprites.c:486: INKEY();
;src\Test_Sprites.c:488: return;
	jp  _INKEY
___str_5:
	.ascii "-----------------Basic Functions"
	.db 0x00
___str_6:
	.ascii "SetSpritesSize(0) SPRITES 8x8"
	.db 0x00
___str_7:
	.ascii "SetSpritesSize(1) SPRITES 16x16"
	.db 0x00
___str_8:
	.ascii "SetSpritesZoom(true) SPRITES x2"
	.db 0x00
___str_9:
	.ascii "ClearSprites()"
	.db 0x00
___str_10:
	.ascii "PUTSPRITE(plane,x,y,color,nSPR)"
	.db 0x00
___str_11:
	.ascii "--------------Extended Functions"
	.db 0x00
___str_12:
	.ascii "SetSpriteVisible(plane,state)"
	.db 0x00
___str_13:
	.ascii "SetSpritePattern(plane,nSPR)"
	.db 0x00
___str_14:
	.ascii "SetSpriteColor(plane,color)"
	.db 0x00
___str_15:
	.ascii "SetSpritePosition(plane,x,y)"
	.db 0x00
___str_16:
	.ascii "SetEarlyClock(plane)"
	.db 0x00
___str_17:
	.ascii "UnsetEarlyClock(plane)"
	.db 0x00
;src\Test_Sprites.c:495: void setSpritesPatterns()
;	---------------------------------
; Function setSpritesPatterns
; ---------------------------------
_setSpritesPatterns::
;src\Test_Sprites.c:497: HALT;
	halt	
;src\Test_Sprites.c:498: CopyToVRAM((uint) SPRITE_DATA,BASE14,32*10);
	ld	bc,#_SPRITE_DATA+0
	ld	hl,#0x0140
	push	hl
	ld	hl,#0x3800
	push	hl
	push	bc
	call	_CopyToVRAM
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
	ret
;src\Test_Sprites.c:504: void showSprites(char offset)
;	---------------------------------
; Function showSprites
; ---------------------------------
_showSprites::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src\Test_Sprites.c:506: char X=0,Y=3;
;src\Test_Sprites.c:509: for(i=0;i<8;i++)
	ld	bc,#0x0300
	ld	-2 (ix),#0x00
00104$:
;src\Test_Sprites.c:511: PUTSPRITE(i, X*32, Y*32, sprcol[i], i+offset);
	ld	a,-2 (ix)
	add	a, 4 (ix)
	ld	e,a
	ld	a,-2 (ix)
	add	a, #<(_sprcol)
	ld	l,a
	ld	a,#0x00
	adc	a, #>(_sprcol)
	ld	h,a
	ld	h,(hl)
	ld	a,b
	rrca
	rrca
	rrca
	and	a,#0xe0
	ld	d,a
	ld	a,c
	rrca
	rrca
	rrca
	and	a,#0xe0
	ld	-1 (ix),a
	push	bc
	ld	a,e
	push	af
	inc	sp
	push	hl
	inc	sp
	push	de
	inc	sp
	ld	h,-1 (ix)
	ld	l,-2 (ix)
	push	hl
	call	_PUTSPRITE
	pop	af
	pop	af
	inc	sp
	pop	bc
;src\Test_Sprites.c:512: X++;
	inc	c
;src\Test_Sprites.c:513: if(X==_LineLength)
	ld	a,(#__LineLength + 0)
;src\Test_Sprites.c:515: X=0;
	sub	a,c
	jr	NZ,00105$
	ld	c,a
;src\Test_Sprites.c:516: Y++;
	inc	b
00105$:
;src\Test_Sprites.c:509: for(i=0;i<8;i++)
	inc	-2 (ix)
	ld	a,-2 (ix)
	sub	a, #0x08
	jr	C,00104$
;src\Test_Sprites.c:520: return;
	ld	sp, ix
	pop	ix
	ret
;src\Test_Sprites.c:526: void testSpriteVisible()
;	---------------------------------
; Function testSpriteVisible
; ---------------------------------
_testSpriteVisible::
;src\Test_Sprites.c:530: SetSpriteVisible(0,false);
	ld	hl,#0x0000
	push	hl
	call	_SetSpriteVisible
	pop	af
;src\Test_Sprites.c:532: for(i=0;i<8;i++)
	ld	c,#0x00
;src\Test_Sprites.c:534: for(o=0;o<8;o++)
00113$:
	ld	b,#0x00
00106$:
;src\Test_Sprites.c:536: if (o==i) SetSpriteVisible(o,true);
	ld	a,c
	sub	a, b
	jr	NZ,00102$
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_SetSpriteVisible
	pop	af
	pop	bc
	jr	00107$
00102$:
;src\Test_Sprites.c:537: else SetSpriteVisible(o,false);  
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_SetSpriteVisible
	pop	af
	pop	bc
00107$:
;src\Test_Sprites.c:534: for(o=0;o<8;o++)
	inc	b
	ld	a,b
	sub	a, #0x08
	jr	C,00106$
;src\Test_Sprites.c:539: WAIT(25);  
	push	bc
	ld	hl,#0x0019
	push	hl
	call	_WAIT
	pop	af
	pop	bc
;src\Test_Sprites.c:532: for(i=0;i<8;i++)
	inc	c
	ld	a,c
	sub	a, #0x08
	jr	C,00113$
;src\Test_Sprites.c:542: return;
	ret
;src\Test_Sprites.c:550: void testSpritePattern()
;	---------------------------------
; Function testSpritePattern
; ---------------------------------
_testSpritePattern::
;src\Test_Sprites.c:555: for(i=2;i<10;i++)
	ld	b,#0x02
00102$:
;src\Test_Sprites.c:557: SetSpritePattern(7, i);
	push	bc
	push	bc
	inc	sp
	ld	a,#0x07
	push	af
	inc	sp
	call	_SetSpritePattern
	ld	hl, #0x0019
	ex	(sp),hl
	call	_WAIT
	pop	af
	pop	bc
;src\Test_Sprites.c:555: for(i=2;i<10;i++)
	inc	b
	ld	a,b
	sub	a, #0x0a
	jr	C,00102$
;src\Test_Sprites.c:561: return;
	ret
;src\Test_Sprites.c:567: void testSpriteColor()
;	---------------------------------
; Function testSpriteColor
; ---------------------------------
_testSpriteColor::
;src\Test_Sprites.c:572: for(i=0;i<16;i++)
	ld	b,#0x00
00102$:
;src\Test_Sprites.c:574: SetSpriteColor(7, i);
	push	bc
	push	bc
	inc	sp
	ld	a,#0x07
	push	af
	inc	sp
	call	_SetSpriteColor
	ld	hl, #0x0019
	ex	(sp),hl
	call	_WAIT
	pop	af
	pop	bc
;src\Test_Sprites.c:572: for(i=0;i<16;i++)
	inc	b
	ld	a,b
	sub	a, #0x10
	jr	C,00102$
;src\Test_Sprites.c:578: return;
	ret
;src\Test_Sprites.c:584: void testSpritePosition()
;	---------------------------------
; Function testSpritePosition
; ---------------------------------
_testSpritePosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src\Test_Sprites.c:590: SetSpriteColor(7, 8);  
	ld	hl,#0x0807
	push	hl
	call	_SetSpriteColor
	pop	af
;src\Test_Sprites.c:592: for(i=0;i<660;i++)
	ld	-1 (ix),#0x40
	ld	c,#0x00
	ld	de,#0x0000
00102$:
;src\Test_Sprites.c:594: HALT;
	halt	
;src\Test_Sprites.c:595: SetSpritePosition(7, SIN[gradX], SIN[gradY]);
	ld	hl,#_SIN
	ld	b,#0x00
	add	hl, bc
	ld	b,(hl)
	ld	a,#<(_SIN)
	add	a, -1 (ix)
	ld	l,a
	ld	a,#>(_SIN)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	push	bc
	push	de
	push	bc
	inc	sp
	ld	d,a
	ld	e,#0x07
	push	de
	call	_SetSpritePosition
	pop	af
	inc	sp
	pop	de
	pop	bc
;src\Test_Sprites.c:596: gradX++;
	inc	-1 (ix)
;src\Test_Sprites.c:597: gradY++;
	inc	c
;src\Test_Sprites.c:592: for(i=0;i<660;i++)
	inc	de
	ld	a,e
	sub	a, #0x94
	ld	a,d
	sbc	a, #0x02
	jr	C,00102$
;src\Test_Sprites.c:601: return;
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
