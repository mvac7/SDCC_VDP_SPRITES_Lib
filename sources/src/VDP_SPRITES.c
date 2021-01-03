/* =============================================================================   
  VDP SPRITE MSX SDCC Library (fR3eL Project)
  Version: 1.0 (04/05/2019)
  Author: mvac7 [mvac7303b@gmail.com]
  Architecture: MSX
  Format: C Object (SDCC .rel)
  Programming language: C and Z80 assembler

  Description:
    Open Source library with functions to directly access to sprites of the 
    TMS9918A.
    
    It uses the functions from the MSX BIOS, so it is designed to create 
    applications in ROM format.
      
    It's complemented with the VDP TMS9918A MSX SDCC Library (fR3eL Project).
     https://github.com/mvac7/SDCC_TMS9918A_Lib
    
    For SDCC 3.9 or higher.
    
  History of versions:
    v1.1 (2/2/2017)                   
============================================================================= */ 

#include "../include/VDP_SPRITES.h"

#include "../include/msxSystemVariables.h"
//#include "../include/msxBIOS.h"




#define YHIDDEN  0xD1   ; concealment of the sprite outside the limits of the screen in TMS9918A modes



char SPRITEYBUFF[32];





 



/* =============================================================================
 PUTSPRITE
 Description: Displays the sprite pattern.
 Input:       [char] sprite plane (0-31) 
              [char] x 
              [char] y
              [char] color (0-15)
              [char] pattern
 Output:      -
============================================================================= */
void PUTSPRITE(char plane, char x, char y, char color, char pattern)
{
plane;x;y;color;pattern;
__asm
  push IX
  ld   IX,#0
  add  IX,SP

  ld   A,4(IX) ;num sprite plane
  call GetSPRattrVADDR
  
  ld   A,6(IX) ;y
  call WriteByte2VRAM ;WRTVRM
  
  inc  HL  
  ld   A,5(IX) ;x
  call WriteByte2VRAM ;WRTVRM
  
  inc  HL  
  ld   E,8(IX)
  call setSpritePattern  ;pattern
  
  inc  HL
  ld   A,7(IX) ;color
  call WriteByte2VRAM ;WRTVRM
  
  pop  IX
  ret
  

; ------------------------------------------------------------------------------
; Input    : A  - Sprite number
; Output   : HL - For the address   
; same as MSX BIOS CALATR:
GetSPRattrVADDR:
  SLA  A    ;*2
  SLA  A    ;*2
  ld   E,A
  ld   D,#0
  ld   HL,#0x1B00 // base 8/13/18 sprite attribute table
  add  HL,DE
 
  ;ret
__endasm;
}



/* =============================================================================
 SetSpritePattern
 Description: Assign a pattern to a sprite plane.
 Input:       [char] sprite plane (0-31) 
              [char] pattern
 Output:      -
============================================================================= */
void SetSpritePattern(char plane, char pattern)
{
plane;pattern; 
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   A,4(ix) ;num sprite plane  
  call GetSPRattrVADDR  ;get vram address
  inc  HL
  inc  HL
  
  ld   E,5(ix) ;number of pattern to assign  
  call setSpritePattern
  
  pop  IX
  ret
  


; set sprite pattern number
; Multiply * 4 when its a 16x16 sprite.
; E - Sprite Number  
setSpritePattern:

  ld   A,(#RG0SAV+1) ; --- read vdp(1) from mem

  bit  1,A        ;Sprite size; 1=16x16
  jr   Z,WRTPAT

  ;if spritesize = 16x16 then A*4
  SLA  E
  SLA  E ;multiplica x4  

WRTPAT:
  LD   A,E
  call WriteByte2VRAM ;WRTVRM
   
  ;ret  
__endasm;
}



/* =============================================================================
 SetSpriteColor
 Description: Assign a color to a sprite plane.
 Input:       [char] sprite plane (0-31) 
              [char] color (0-15)
 Output:      -
============================================================================= */
void SetSpriteColor(char plane, char color)
{
plane;color;
__asm
  push IX
  ld   IX,#0
  add  IX,SP

  ld   A,4(IX) ;num sprite plane
  call GetSPRattrVADDR

  inc  HL
  inc  HL
  inc  HL
  
  ld   A,5(IX) ;color
  call WriteByte2VRAM ;WRTVRM
  
  pop  IX

__endasm;
}



/* =============================================================================
 SetSpritePosition
 Description: Assigns the position coordinates of a sprite plane.
 Input:       [char] sprite plane (0-31) 
              [char] x 
              [char] y
 Output:      -
============================================================================= */
void SetSpritePosition(char plane, char x, char y)
{
plane;x;y;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   A,4(ix) ;num sprite
  call GetSPRattrVADDR
  
  ld   A,6(ix)   ;y
  call WriteByte2VRAM ;WRTVRM
  
  inc  HL
  ld   A,5(ix)   ;x
  call WriteByte2VRAM ;WRTVRM
  
  pop  IX
__endasm;
}



/* =============================================================================
 SetSpriteVisible
 Description: Hides or shows a sprite plane.
 Input:       [char] sprite plane (0-31) 
              [boolean] visible state
 Output:      -
============================================================================= */
void SetSpriteVisible(char plane, boolean state)
{
plane;state;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
        
  ld   A,4(ix) ;num sprite
  
  ld   IY,#_SPRITEYBUFF
  ld   D,#0
  ld   E,A
  ADD  IY,DE
  
  call GetSPRattrVADDR

  ld   A,5(ix) ;state
  or   A ;0 = off
  jr   Z,SPRITEOFF
  
;sprite ON
  ld   A,(IY)
  
  call WriteByte2VRAM ;WRTVRM
    
  pop  IX
  ret


;sprite OFF
SPRITEOFF:
  call ReadByteFromVRAM   ;RDVRM
  cp   #YHIDDEN
  jr   Z,ENDOFF ;if not visible then Dont overwrite. 
  
  ld   (IY),A
  ld   A,#YHIDDEN
  call WriteByte2VRAM ;WRTVRM
  
ENDOFF:
  pop  IX
__endasm;
}



/* =============================================================================
 SetEarlyClock
 Description: Apply the Early Clock of a sprite plane. Move 32 points to the 
              left the X position of the sprite.
 Input:       [char] sprite plane (0-31) 
 Output:      -
============================================================================= */
void SetEarlyClock(char plane)
{
plane;
__asm
  push IX
  ld   IX,#0
  add  IX,SP
  
  ld   A,4(IX) 
  call GetSPRattrVADDR
  
  inc  HL
  inc  HL
  inc  HL
  push HL
  call ReadByteFromVRAM   ;RDVRM
  OR   #128
  pop  HL
  call WriteByte2VRAM ;WRTVRM VPOKE
  

  pop  IX
__endasm;
}



/* =============================================================================
 UnsetEarlyClock
 Description: Disables the Early Clock. Restore the position of a sprite plane.
 Input:       [char] sprite plane (0-31)
 Output:      -
============================================================================= */
void UnsetEarlyClock(char plane)
{
plane;
__asm
  push IX
  ld   IX,#0
  add  IX,SP

  ld   A,4(IX) 
  call GetSPRattrVADDR
  
  inc  HL
  inc  HL
  inc  HL
  call ReadByteFromVRAM   ;RDVRM
  and  #127
  call WriteByte2VRAM ;WRTVRM
  
  pop  IX
  ;ret
  
__endasm;
}