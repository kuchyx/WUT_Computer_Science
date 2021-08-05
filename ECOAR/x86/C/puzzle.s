	.file	"puzzle.c"
	.intel_syntax noprefix
	.globl	_BMP_HEADER_SIZE
	.section .rdata,"dr"
	.align 4
_BMP_HEADER_SIZE:
	.long	54
	.globl	_BMP_SIGNATURE_0x
	.align 4
_BMP_SIGNATURE_0x:
	.long	19778
	.globl	_NUMBER_OF_HEADERS
	.align 4
_NUMBER_OF_HEADERS:
	.long	1
	.globl	_BYTE_PER_PIXEL
	.align 4
_BYTE_PER_PIXEL:
	.long	24
	.globl	_DESIRED_COMPRESSION_VALUE
	.align 4
_DESIRED_COMPRESSION_VALUE:
	.space 4
	.globl	_CANNOT_OPEN_FILE_FOR_WRITING
	.align 4
_CANNOT_OPEN_FILE_FOR_WRITING:
	.long	-1
	.globl	_CANNOT_WRITE_HEADER_OR_IMAGE
	.align 4
_CANNOT_WRITE_HEADER_OR_IMAGE:
	.long	-2
	.globl	_BYTES_FOR_SINGLE_PIXEL
	.align 4
_BYTES_FOR_SINGLE_PIXEL:
	.long	3
	.globl	_WRONG_BMP_HEADER_SIZE
	.align 4
_WRONG_BMP_HEADER_SIZE:
	.long	1
	.globl	_ERROR_READING_SOURCE_FILE
	.align 4
_ERROR_READING_SOURCE_FILE:
	.long	2
	.globl	_ENTER_VERTICAL_DIVISON_MESSAGE
	.align 32
_ENTER_VERTICAL_DIVISON_MESSAGE:
	.ascii "Enter number of vertical divisons: \0"
	.globl	_ENTER_HORIZONTAL_DIVISON_MESSAGE
	.align 32
_ENTER_HORIZONTAL_DIVISON_MESSAGE:
	.ascii "Enter number of horizontal divisons: \0"
	.globl	_WRONG_BMP_HEADER_SIZE_MESSAGE
	.align 32
_WRONG_BMP_HEADER_SIZE_MESSAGE:
	.ascii "Check compilation options so as bmpHeaderInfo struct size is 54 bytes.\12\0"
	.globl	_READ_AND_BINARY_MODE
_READ_AND_BINARY_MODE:
	.ascii "rb\0"
	.globl	_WRITE_AND_BINARY_MODE
_WRITE_AND_BINARY_MODE:
	.ascii "wb\0"
	.globl	_SOURCE_IMAGE_NAME
_SOURCE_IMAGE_NAME:
	.ascii "source.bmp\0"
	.globl	_DESTINATION_IMAGE_NAME
_DESTINATION_IMAGE_NAME:
	.ascii "dest.bmp\0"
	.globl	_ERROR_READING_SOURCE_FILE_MESSAGE
	.align 32
_ERROR_READING_SOURCE_FILE_MESSAGE:
	.ascii "Error reading source file (probably).\12\0"
	.text
	.globl	_allocateSpaceForImageInfo
	.def	_allocateSpaceForImageInfo;	.scl	2;	.type	32;	.endef
_allocateSpaceForImageInfo:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [esp], 20
	call	_malloc
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 0
	je	L2
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax], 0
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+4], 0
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+8], 0
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+12], 0
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+16], 0
L2:
	mov	eax, DWORD PTR [ebp-12]
	leave
	ret
	.globl	_freeImageInfo
	.def	_freeImageInfo;	.scl	2;	.type	32;	.endef
_freeImageInfo:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	cmp	DWORD PTR [ebp+8], 0
	je	L5
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+12]
	test	eax, eax
	je	L6
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [esp], eax
	call	_free
L6:
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+16]
	test	eax, eax
	je	L7
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR [esp], eax
	call	_free
L7:
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_free
L5:
	mov	eax, 0
	leave
	ret
	.globl	_freeResources
	.def	_freeResources;	.scl	2;	.type	32;	.endef
_freeResources:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	cmp	DWORD PTR [ebp+8], 0
	je	L10
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_fclose
L10:
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_freeImageInfo
	leave
	ret
	.globl	_readBMP
	.def	_readBMP;	.scl	2;	.type	32;	.endef
_readBMP:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 36
	mov	DWORD PTR [ebp-12], 0
	mov	DWORD PTR [ebp-16], 0
	call	_allocateSpaceForImageInfo
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 0
	jne	L13
	mov	eax, 0
	jmp	L14
L13:
	mov	DWORD PTR [esp+4], OFFSET FLAT:_READ_AND_BINARY_MODE
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_fopen
	mov	DWORD PTR [ebp-16], eax
	cmp	DWORD PTR [ebp-16], 0
	jne	L15
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_freeResources
	jmp	L14
L15:
	mov	DWORD PTR [esp], 54
	call	_malloc
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+16], edx
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	test	eax, eax
	je	L16
	mov	eax, 1
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], 54
	mov	DWORD PTR [esp], eax
	call	_fread
	mov	edx, 1
	cmp	eax, edx
	je	L17
L16:
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_freeResources
	jmp	L14
L17:
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	movzx	eax, WORD PTR [eax]
	movzx	edx, ax
	mov	eax, 19778
	cmp	edx, eax
	jne	L18
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	movzx	eax, WORD PTR [eax+26]
	cmp	ax, 1
	jne	L18
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	movzx	eax, WORD PTR [eax+28]
	movsx	edx, ax
	mov	eax, 24
	cmp	edx, eax
	jne	L18
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [eax+30]
	mov	eax, 0
	cmp	edx, eax
	je	L19
L18:
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_freeResources
	jmp	L14
L19:
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+34]
	mov	DWORD PTR [esp], eax
	call	_malloc
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+12], edx
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+12]
	test	eax, eax
	je	L20
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [eax+34]
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], eax
	call	_fread
	mov	edx, DWORD PTR [ebp-12]
	mov	edx, DWORD PTR [edx+16]
	mov	edx, DWORD PTR [edx+34]
	cmp	eax, edx
	je	L21
L20:
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_freeResources
	jmp	L14
L21:
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_fclose
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+18]
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax], edx
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+22]
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+4], edx
	mov	eax, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+34]
	mov	edx, DWORD PTR [ebp-12]
	mov	edx, DWORD PTR [edx+16]
	mov	edx, DWORD PTR [edx+22]
	mov	ebx, edx
	mov	edx, 0
	div	ebx
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [eax+8], edx
	mov	eax, DWORD PTR [ebp-12]
L14:
	add	esp, 36
	pop	ebx
	pop	ebp
	ret
	.globl	_saveBMP
	.def	_saveBMP;	.scl	2;	.type	32;	.endef
_saveBMP:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [esp+4], OFFSET FLAT:_WRITE_AND_BINARY_MODE
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_fopen
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 0
	jne	L23
	mov	eax, -1
	jmp	L24
L23:
	mov	eax, 1
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], 54
	mov	DWORD PTR [esp], eax
	call	_fwrite
	mov	edx, 1
	cmp	eax, edx
	jne	L25
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+16]
	mov	edx, DWORD PTR [eax+34]
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], eax
	call	_fwrite
	mov	edx, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [edx+16]
	mov	edx, DWORD PTR [edx+34]
	cmp	eax, edx
	je	L26
L25:
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	call	_fclose
	mov	eax, -2
	jmp	L24
L26:
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	call	_fclose
	mov	eax, 0
L24:
	leave
	ret
	.globl	_set_pixel
	.def	_set_pixel;	.scl	2;	.type	32;	.endef
_set_pixel:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+8]
	imul	eax, DWORD PTR [ebp+16]
	mov	ecx, eax
	mov	eax, 3
	imul	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	add	eax, edx
	mov	DWORD PTR [ebp-4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	cmp	eax, DWORD PTR [ebp+12]
	ja	L28
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	eax, DWORD PTR [ebp+16]
	jbe	L27
L28:
	mov	eax, DWORD PTR [ebp+20]
	shr	eax, 16
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-4]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+1]
	mov	eax, DWORD PTR [ebp+20]
	shr	eax, 8
	mov	BYTE PTR [edx], al
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [eax+2]
	mov	eax, DWORD PTR [ebp+20]
	mov	BYTE PTR [edx], al
L27:
	leave
	ret
	.globl	_getColor
	.def	_getColor;	.scl	2;	.type	32;	.endef
_getColor:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	cmp	eax, DWORD PTR [ebp+12]
	ja	L31
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	eax, DWORD PTR [ebp+16]
	jbe	L32
L31:
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+8]
	imul	eax, DWORD PTR [ebp+16]
	mov	ecx, eax
	mov	eax, 3
	imul	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	add	eax, edx
	mov	DWORD PTR [ebp-8], eax
	mov	eax, DWORD PTR [ebp-8]
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR [ebp-1], al
	mov	eax, DWORD PTR [ebp-8]
	add	eax, 1
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR [ebp-2], al
	mov	eax, DWORD PTR [ebp-8]
	add	eax, 2
	movzx	eax, BYTE PTR [eax]
	mov	BYTE PTR [ebp-3], al
L32:
	mov	DWORD PTR [ebp-12], 0
	movsx	eax, BYTE PTR [ebp-1]
	movzx	eax, al
	sal	eax, 16
	mov	edx, eax
	movsx	eax, BYTE PTR [ebp-2]
	sal	eax, 8
	movzx	eax, ax
	or	edx, eax
	movsx	eax, BYTE PTR [ebp-3]
	movzx	eax, al
	or	eax, edx
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp-12]
	leave
	ret
	.section .rdata,"dr"
LC0:
	.ascii "%d\0"
	.text
	.globl	_userEnterDivisions
	.def	_userEnterDivisions;	.scl	2;	.type	32;	.endef
_userEnterDivisions:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [esp], OFFSET FLAT:_ENTER_VERTICAL_DIVISON_MESSAGE
	call	_printf
	lea	eax, [ebp-16]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:_ENTER_HORIZONTAL_DIVISON_MESSAGE
	call	_printf
	lea	eax, [ebp-16]
	add	eax, 4
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_scanf
	mov	eax, DWORD PTR [ebp-16]
	mov	edx, DWORD PTR [ebp-12]
	leave
	ret
	.globl	_calculateStartingPixelX
	.def	_calculateStartingPixelX;	.scl	2;	.type	32;	.endef
_calculateStartingPixelX:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	eax, DWORD PTR [ebp+8]
	cdq
	idiv	DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-4], edx
	cmp	DWORD PTR [ebp-4], 0
	jne	L37
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-4], eax
L37:
	mov	eax, DWORD PTR [ebp-4]
	sub	eax, 1
	imul	eax, DWORD PTR [ebp+16]
	leave
	ret
	.globl	_calculateStartingPixelY
	.def	_calculateStartingPixelY;	.scl	2;	.type	32;	.endef
_calculateStartingPixelY:
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 1
	cdq
	idiv	DWORD PTR [ebp+12]
	imul	eax, DWORD PTR [ebp+16]
	pop	ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "Check compilation options so as bmpHeaderInfo struct size is 54 bytes.\0"
	.align 4
LC2:
	.ascii "Error reading source file (probably).\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	push	ebp
	mov	ebp, esp
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 112
	call	___main
	mov	DWORD PTR [esp+96], 0
	mov	eax, 54
	cmp	eax, 54
	je	L42
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_puts
	mov	eax, 1
	jmp	L51
L42:
	mov	DWORD PTR [esp], OFFSET FLAT:_SOURCE_IMAGE_NAME
	call	_readBMP
	mov	DWORD PTR [esp+92], eax
	cmp	DWORD PTR [esp+92], 0
	jne	L44
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
	mov	eax, 2
	jmp	L51
L44:
	call	_userEnterDivisions
	mov	DWORD PTR [esp+28], eax
	mov	DWORD PTR [esp+32], edx
	mov	edx, DWORD PTR [esp+28]
	mov	eax, DWORD PTR [esp+32]
	imul	eax, edx
	mov	DWORD PTR [esp+88], eax
	mov	eax, DWORD PTR [esp+92]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [esp+32]
	mov	ebx, edx
	mov	edx, 0
	div	ebx
	mov	DWORD PTR [esp+84], eax
	mov	eax, DWORD PTR [esp+92]
	mov	eax, DWORD PTR [eax+4]
	mov	edx, DWORD PTR [esp+28]
	mov	esi, edx
	mov	edx, 0
	div	esi
	mov	DWORD PTR [esp+80], eax
	mov	DWORD PTR [esp], 0
	call	_time
	mov	DWORD PTR [esp], eax
	call	_srand
	mov	DWORD PTR [esp+108], 1
	jmp	L45
L50:
	call	_rand
	cdq
	idiv	DWORD PTR [esp+88]
	mov	DWORD PTR [esp+76], edx
	mov	eax, DWORD PTR [esp+32]
	mov	edx, DWORD PTR [esp+84]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+108]
	mov	DWORD PTR [esp], eax
	call	_calculateStartingPixelX
	mov	DWORD PTR [esp+72], eax
	mov	eax, DWORD PTR [esp+32]
	mov	edx, DWORD PTR [esp+80]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+108]
	mov	DWORD PTR [esp], eax
	call	_calculateStartingPixelY
	mov	DWORD PTR [esp+68], eax
	mov	eax, DWORD PTR [esp+32]
	mov	edx, DWORD PTR [esp+84]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+76]
	mov	DWORD PTR [esp], eax
	call	_calculateStartingPixelX
	mov	DWORD PTR [esp+64], eax
	mov	eax, DWORD PTR [esp+32]
	mov	edx, DWORD PTR [esp+80]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+76]
	mov	DWORD PTR [esp], eax
	call	_calculateStartingPixelY
	mov	DWORD PTR [esp+60], eax
	mov	DWORD PTR [esp+104], 0
	mov	DWORD PTR [esp+104], 0
	jmp	L46
L49:
	mov	DWORD PTR [esp+100], 0
	mov	DWORD PTR [esp+100], 0
	jmp	L47
L48:
	mov	eax, DWORD PTR [esp+104]
	mov	edx, DWORD PTR [esp+72]
	add	eax, edx
	mov	DWORD PTR [esp+56], eax
	mov	eax, DWORD PTR [esp+100]
	mov	edx, DWORD PTR [esp+68]
	add	eax, edx
	mov	DWORD PTR [esp+52], eax
	mov	eax, DWORD PTR [esp+104]
	mov	edx, DWORD PTR [esp+64]
	add	eax, edx
	mov	DWORD PTR [esp+48], eax
	mov	eax, DWORD PTR [esp+100]
	mov	edx, DWORD PTR [esp+60]
	add	eax, edx
	mov	DWORD PTR [esp+44], eax
	mov	edx, DWORD PTR [esp+52]
	mov	eax, DWORD PTR [esp+56]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp], eax
	call	_getColor
	mov	DWORD PTR [esp+40], eax
	mov	edx, DWORD PTR [esp+44]
	mov	eax, DWORD PTR [esp+48]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp], eax
	call	_getColor
	mov	DWORD PTR [esp+36], eax
	mov	edx, DWORD PTR [esp+44]
	mov	eax, DWORD PTR [esp+48]
	mov	ecx, DWORD PTR [esp+40]
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp], eax
	call	_set_pixel
	mov	edx, DWORD PTR [esp+52]
	mov	eax, DWORD PTR [esp+56]
	mov	ecx, DWORD PTR [esp+36]
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp], eax
	call	_set_pixel
	add	DWORD PTR [esp+100], 1
L47:
	mov	eax, DWORD PTR [esp+100]
	cmp	eax, DWORD PTR [esp+80]
	jl	L48
	add	DWORD PTR [esp+104], 1
L46:
	mov	eax, DWORD PTR [esp+104]
	cmp	eax, DWORD PTR [esp+84]
	jl	L49
	add	DWORD PTR [esp+108], 1
L45:
	mov	eax, DWORD PTR [esp+108]
	cmp	eax, DWORD PTR [esp+88]
	jle	L50
	mov	DWORD PTR [esp+4], OFFSET FLAT:_DESTINATION_IMAGE_NAME
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp], eax
	call	_saveBMP
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], 0
	call	_freeResources
	mov	eax, 0
L51:
	lea	esp, [ebp-8]
	pop	ebx
	pop	esi
	pop	ebp
	ret
	.ident	"GCC: (GNU) 4.8.3"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fread;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
