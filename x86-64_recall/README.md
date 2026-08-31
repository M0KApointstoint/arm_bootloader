# x86-64, Linux, NASM

**Tehnical details:**

- *Architecture*: x86-64 (a. k. a. AMD64, x64);

- *Encoding*: variable length, 1 - 15 bytes per instruction;

- *Assembler*: NASM;

- *Syntax*: Intel;

- *Linker*: GNU ld;

- *OS*: GNU/Linux (Distro: Ubuntu);

- *Syscall ABI*: Linux x86-64
    -> number: rax;
    -> args: rdi, rsi, rdx, r10, r8, r9;
    -> return: rax;
    -> preserved: rdi, rsi, rdx, r10, r8, r9, rbx, rsp, rbp, r12 - r15;
    -> modified: rax(return value), rcx(old rip), r11(old rflags);

