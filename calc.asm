.model small
.stack 100h
.data

TestString01	BYTE	"***********************************",0dh,0ah,

		BYTE	"* Calculation Project Based On Input  *",0dh,0ah,

		BYTE	"***********************************",0dh,0ah,'$'


TestString02	BYTE	"WriteBin: Printing a binary number....: ",'$'

TestString03	BYTE	"ReadChar: Type an ASCII character.....: ",'$'

TestString04	BYTE	"Writechar: That character was.........: ",'$'

TestString05	BYTE	"ReadString: Type an ASCII String......: " ,'$'

TestString06	BYTE	"WriteString...........................: ",'$'

TestString07	BYTE	"ReadDec: Type a 16bit Decimal number..: ",'$'

TestString08	BYTE	"WriteDec: The Number was..............: ",'$'

TestString09	BYTE	"ReadHex: Type a 16bit Hex number......: ",'$'

TestString10	BYTE	"WriteHex:The Number was...............: ",'$'

TestString11	BYTE	"WriteDec: Number of Characters Typed..: ",'$'

Buffer		BYTE	10 DUP ('!')

.code
Main proc
 mov ax ,@data

    mov ds,ax


    call clrscr				;Clear the Screen
    mov dx, offset TestString01		;First Large Prompt/Header
    call writestring

    call crlf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  call crlf
  mov dx, offset TestString03
  call WriteString
  call Readchar
  call crlf

  mov dx, offset TestString04
  call WriteString
  call Writechar
  call crlf

  ;;;;;;;;;;
  call crlf
  mov dx, offset TestString05
  call WriteString

  Mov ax, 4c00h
  Int 21h
Main endp

clrscr PROC

	mov ah, 06h	; scroll up
	mov al, 0	; entire window
	mov ch, 0	; upper left row
	mov cl, 0	; upper left col
	mov dh, 24	; lower right row
	mov dl, 79	; lower right col
	mov bh, 7	; attribute for blanked area
	int 10h		; white: RGB=111=7
	ret
clrscr ENDP

writeString PROC
	mov bx, ax
	mov si, dx
	
  L1:
	 mov al, [si]
	 cmp al, '$'
	 je quit
	 call Writechar
	 inc si
	 jmp L1
	quit:
	mov ax, bx
	ret
writeString ENDP

crlf PROC
	Mov di, ax
	Mov ah, 06h
	Mov dl, 0Ah
	int 21h
	Mov dl, 0Dh
	int 21h
	mov ax, di
	ret
crlf ENDP

Readchar PROC
      Mov ah, 08h
      mov dl, al
      int 21h
      Mov ah, 0
     ret
ReadChar ENDP

Writechar PROC
  mov dh, 0
  mov ah, 06h
  mov dl, al
  Int 21h
  ret
Writechar ENDP
     End Main
