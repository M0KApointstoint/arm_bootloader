# x86-64 ABI conventinos

These are some of the ABI convetions that I have used while doing
**x86-64 assembly**.

- *Syscall ABI*: Linux x86-64 -> invoked with `syscall`
    -> number: `rax`;

    -> args: `rdi`, `rsi`, `rdx`, `r10`, `r8`, `r9`;

    -> return: `rax`;

    -> preserved: `rdi`, `rsi`, `rdx`, `r10`, `r8`, `r9`, `rbx`, `rsp`, `rbp`, `r12`-`r15`;

    -> clobbered (modified): `rax` (return value), `rcx` (old `rip`), `r11` (old `rflags`);

- *Function Calling ABI*: System V AMD64
    -> args: `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`;

    -> return: `rax`;

    -> caller-saved: `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`, `rax`, `r10`, `r11`;

    -> callee-saved: `rbx`, `rbp`, `rsp`, `r12`-`r15`;

    -> `rsp` must be 16-byte aligned before executing a `call` instruction.

## Comparison with AArch32

Since `x86-64` is the first architecture I learned about, it is nice to see what
`ARM` brings to the table: [`lessons/abi_docs.md`](../lessons/abi_docs.md).

**Big difference that needs to be taken care of:**

*The philosophy behind the return address:*

- On `x86-64`, `call` pushes the return address onto the stack,
so nesting calls costs nothing extra.

- On `ARM`, `bl` writes the return address into `lr`, a single register, so
nesting calls will result in the first return address to be gone unless
saved somewhere. Remembered this thanks to this practice problem:
[`practice`](../lessons/ARM_practice/3_program/)

