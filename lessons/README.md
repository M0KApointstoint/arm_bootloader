# AArch32(ARM), Linux, GNU as

## Right now working on `/bare-metal` !!! Check it out!

*More details coming soon!*

**Technical details:**

- *Architecture*: AArch32(32-bit ARM);

- *Instruction set*: A32(the "ARM" instruction set), not Thumb/T32;

- *Encoding*: fixed length, 4 bytes per instruction;

- *Assembler*: GNU as;

- *Syntax*: ARM / GAS;

- *Linker*: GNU ld;

- *OS*: GNU/Linux(Distro: Ubuntu);

- *Runtime*: x86-64 host + qemu-arm;

- *Syscall ABI*: Linux ARM EABI (Embedded ABI)
    -> number: r7;

    -> args: r0-r5;

    -> return: r0;

    -> preserved: r1 - r12, sp, lr;

    -> modified: r0.


- *Function calling ABI*: AAPCS32(hard-float variant)
    -> args: r0 - r3, then the stack;

    -> return: r0;

    -> caller-saved: r0 - r3, r12(ip -> intra-procedure scratch);

    -> callee-saved: r4 - r8, r9 (sb / tr -> platform register, avoid), r10, r11.

    -> stack needs to be 8 - byte aligned.

