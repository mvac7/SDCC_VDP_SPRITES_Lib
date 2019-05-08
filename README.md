# VDP SPRITES Functions Library (object type)

Version: 1.0 (04/05/2019) May the 4th be with you!

Author: mvac7/303bcn

Architecture: MSX

Format: C Object (SDCC .rel)

Programming language: C

WEB:
 
mail: mvac7303b@gmail.com



## Sorry!: This text is pending correction of the English translation. <<<<<<<<



### History of versions:
- v1.0 (04/05/2019) May the 4th be with you! <<current version>>


## 1. Introduction

Open Source library with functions to directly access to Sprites of the TMS9918A.

Provides basic functions for display Sprites and functions for access specific 
parameters (positioning, color, pattern, visibility and EarlyClock).

Contains the PUTSPRITE function similar to that of MSX BASIC.

Requires the VDP TMS9918A Library. https://github.com/mvac7/SDCC_TMS9918A_Lib

It does not use the MSX BIOS, so it is suitable for creating applications for 
MSXDOS and ROM format.
  
Use them for developing MSX applications using Small Device C Compiler (SDCC) compilator.

Includes an application for test and learning purposes.





## 2. Acknowledgments
  
Thanks for Info & help, to:

* Avelino Herrera > http://msx.atlantes.org/index_es.html
* Nerlaska > http://albertodehoyonebot.blogspot.com.es
* Fubu > http://www.gamerachan.org/fubu/
* Marq/Lieves!Tuore > http://www.kameli.net/lt/
* Sapphire/Z80ST > http://z80st.auic.es/
* Pentacour > http://pentacour.com/
* JamQue/TPM > http://www.thepetsmode.com/
* Andrear > http://andrear.altervista.org/home/msxsoftware.php
* Konamiman > https://www.konamiman.com
* MSX Assembly Page > http://map.grauw.nl/resources/msxbios.php
* Portar MSX Tech Doc > http://nocash.emubase.de/portar.htm
* MSX Resource Center > http://www.msx.org/
* Karoshi MSX Community > http://karoshi.auic.es/
* BlueMSX >> http://www.bluemsx.com/
* OpenMSX >> http://openmsx.sourceforge.net/
* Meisei  >> ?



## 3. Requirements

* Small Device C Compiler (SDCC) v3.6 http://sdcc.sourceforge.net/
* Hex2bin v2.2 http://hex2bin.sourceforge.net/ 
* VDP TMS9918A Library. https://github.com/mvac7/SDCC_TMS9918A_Lib



## 4. Notes about operation

This library provides functions to facilitate the use of Sprites of the TMS9918A 
and is supported by the library VDP_TMS9918A_Lib, necessary for the 
initialization of the graphic modes and for the writing / reading of the VRAM.

It is designed for the creation of applications for MSX-DOS (.COM). It can be 
used for the development of ROMs, but I recommend the use of libraries based on 
the BIOS (VDP_TMS9918A_MSXROM_Lib and VDP_SPRITES_MSXROM_Lib), since they are 
lighter, thereby gaining more space for our software.

It is not useful for graphic mode G3 (screen 4), V9938 or higher, since it does 
not write in the color table of the sprites when a color is assigned or for the 
Early Clock. I have projected a specific library for this purpose.



## 5. Functions

* void PUTSPRITE(char plane, char x, char y, char color, char pattern) - Displays the sprite pattern.
* void SetSpritePattern(char plane, char pattern) - Assign a pattern to a sprite plane.
* void SetSpriteColor(char plane, char color) - Assign a color to a sprite plane.
* void SetSpritePosition(char plane, char x, char y) - Assigns the position coordinates of a sprite plane.
* void SetSpriteVisible(char plane, boolean state) - Hides or shows a sprite plane.
* void SetEarlyClock(char plane) - Apply the Early Clock of a sprite plane. Move 32 points to the left the X position of the sprite.
* void UnsetEarlyClock(char plane) - Disables the Early Clock. Restore the position of a sprite plane.
