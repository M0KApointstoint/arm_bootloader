# AArch32 ABI conventions

These are some of the ABI conventions that I have used while learning
`ARM Assembly`.

- *Syscall ABI*: Linux ARM EABI (Embedded ABI) -> invoked with `swi 0`
    -> number: `r7`;

    -> args: `r0`-`r5`;

    -> return: `r0`;

    -> preserved: `r1`-`r12`, `sp`, `lr`;

    -> clobbered (modified): `r0`.

- *Function calling ABI*: AAPCS32 (hard-float variant)
    -> args: `r0`-`r3`, then the stack;

    -> return: `r0`;

    -> caller-saved: `r0`-`r3`, `r12`(`ip` -> intra-procedure scratch);

    -> callee-saved: `r4`-`r8`, `r9` (`sb`/`tr` -> platform register, avoid), `r10`, `r11`.

    -> stack needs to be 8-byte aligned.

## Comparison with x86-64

Since I first learned about the `x86` architecture I took similar notes here:
[`x86-64_recall/abi_docs.md`](../x86-64_recall/abi_docs.md).

