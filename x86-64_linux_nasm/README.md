# x86-64, Linux, NASM

**Technical details:**

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

- *Function Calling ABI*: System V AMD64
    -> args: rdi, rsi, rdx, rcx, r8, r9;
    -> return: rax;
    -> caller-saved: rdi, rsi, rdx, rcx, r8, r9, rax, r10, r11;
    -> callee-saved: rbx, rbp, rsp, r12 - r15;
    -> rsp must be 16-byte aligned before executing a `call` instruction.

