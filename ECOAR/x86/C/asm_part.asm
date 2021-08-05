section	.text
global hello_world     ;must be declared for linker (ld)

hello_world:	          ;tells linker entry point

  push ebp
  mov ebp,esp
  push ebx

  mov	edx,len     ;message length
  mov	ecx,msg     ;message to write
  mov	ebx,1       ;file descriptor (stdout)
  mov	eax,4       ;system call number (sys_write)
  int	0x80        ;call kernel

  pop ebx
  mov esp, ebp
  pop ebp
  ret

;mov	eax,1       ;system call number (sys_exit)
;int	0x80        ;call kernel

section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
len equ $ - msg     ;length of the string
