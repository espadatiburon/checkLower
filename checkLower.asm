; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'checkLower.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'checkLower.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'checkLower.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'checkLower.consts.inc'

		include	'checkLower.ro.inc'

; Code begins here:
L806_gets__hla_:
		mov	dword ptr [L812_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L811_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L810_dEAXRegister__hla_+0], eax	;/* dEAXRegister */
		mov	word ptr [L809_wDXRegister__hla_+0], dx	;/* wDXRegister */
		mov	word ptr [L808_wDIRegister__hla_+0], di	;/* wDIRegister */
		pop	dword ptr [L807_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	di
		pop	ebx
		push	dword ptr [L807_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	word ptr [L808_wDIRegister__hla_+0]	;/* wDIRegister */
		push	word ptr [L809_wDXRegister__hla_+0]	;/* wDXRegister */
		push	dword ptr [L812_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L811_dEBXRegister__hla_+0]	;/* dEBXRegister */
		push	dword ptr [L810_dEAXRegister__hla_+0]	;/* dEAXRegister */
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_A_GETS	; a_gets
		mov	dword ptr [L813_sData__hla_+0], eax	;/* sData */
		mov	dx, 0
		mov	ecx, 0

L814_getsRepeatLoop__hla_:
		cmp	di, 0
		je	L815_getsEndLoop__hla_
		cmp	[eax+ecx*1+0], dh	;/* [eax+ecx] */
		je	L815_getsEndLoop__hla_
		mov	dl, [eax+ecx*1+0]	;/* [eax+ecx] */
		mov	byte ptr [ebx+0], dl	;/* (type char [ebx]) */
		inc	ecx
		inc	ebx
		dec	di
		jmp	L814_getsRepeatLoop__hla_

L815_getsEndLoop__hla_:
		mov	byte ptr [ebx+0], dh	;/* (type char [ebx]) */
		push	dword ptr [L813_sData__hla_+0]	; sData
		call	STR_FREE	; strfree
		pop	eax
		pop	ebx
		pop	ecx
		pop	dx
		pop	di
		ret
xL806_gets__hla___hla_:
;L806_gets__hla_ endp

L816_puts__hla_:
		mov	dword ptr [L819_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	word ptr [L818_wDXRegister__hla_+0], dx	;/* wDXRegister */
		pop	dword ptr [L817_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		push	dword ptr [L817_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L819_dEBXRegister__hla_+0]	;/* dEBXRegister */
		push	word ptr [L818_wDXRegister__hla_+0]	;/* wDXRegister */
		mov	dx, 0

L820_putsRepeatLoop__hla_:
		cmp	[ebx+0], dh	;/* [ebx] */
		je	L821_putsEndLoop__hla_
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebx+0]	; [ebx]
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTC	; putc
		inc	ebx
		jmp	L820_putsRepeatLoop__hla_

L821_putsEndLoop__hla_:
		pop	dx
		pop	ebx
		ret
xL816_puts__hla___hla_:
;L816_puts__hla_ endp

L823_isAllLowerCase__hla_:
		mov	dword ptr [L828_tempEBX__hla_+0], ebx	;/* tempEBX */
		mov	dword ptr [L827_tempECX__hla_+0], ecx	;/* tempECX */
		mov	dword ptr [L826_tempEDX__hla_+0], edx	;/* tempEDX */
		pop	dword ptr [L824_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	edx
		push	dword ptr [L824_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L826_tempEDX__hla_+0]	;/* tempEDX */
		push	dword ptr [L827_tempECX__hla_+0]	;/* tempECX */
		push	dword ptr [L828_tempEBX__hla_+0]	;/* tempEBX */
		mov	ch, 0
		mov	cl, 97
		mov	bl, 122

L829_WhileLp__hla_:

L830_WhileLpTermination__hla_:
		cmp	[edx+0], ch	;/* [edx] */
		je	L831_WhileLpDone__hla_

L832_WhileLpBody__hla_:
		cmp	[edx+0], cl	;/* [edx] */
		jl	L833_notLower__hla_
		cmp	[edx+0], bl	;/* [edx] */
		jg	L833_notLower__hla_
		inc	edx
		jmp	L829_WhileLp__hla_

L833_notLower__hla_:
		mov	byte ptr [L825_resultOfLower__hla_+0], 0	;/* resultOfLower */
		jmp	L831_WhileLpDone__hla_

L831_WhileLpDone__hla_:
		mov	al, byte ptr [L825_resultOfLower__hla_+0]	;/* resultOfLower */
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL823_isAllLowerCase__hla___hla_:
;L823_isAllLowerCase__hla_ endp




;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L847_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, 1
		mov	bl, 80
		inc	bl
		mul	bl
		mov	ebx, 0
		mov	bx, ax
		push	ebx
		call	MEM_ALLOC	; malloc
		mov	dword ptr [L822_stringData__hla_+0], eax	;/* stringData */
		mov	ebx, dword ptr [L822_stringData__hla_+0]	;/* stringData */
		push	ebx
		mov	cx, 80
		push	cx
		call	L806_gets__hla_
		push	L865_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ebx, dword ptr [L822_stringData__hla_+0]	;/* stringData */
		push	ebx
		call	L816_puts__hla_
		call	STDOUT_NEWLN	; newln
		mov	eax, 0
		mov	ebx, L866_stringData__hla_
		push	ebx
		call	L823_isAllLowerCase__hla_
		push	L880_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


