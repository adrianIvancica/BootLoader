[BITS 16]
[OTG 0x7c00]


start:
    cli ;Clear interrupts
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti ;enabling interruptions to happen

print:
    lodsb ;Loading byte at ds si to all the register and increments si
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x10
    jmp print

done:
    cli
    hit ; stop execution for CPU

msg: db 'Hello World!'. 0

times 510 - ($ - $$), db 0

dw 0xAA55

mov
