# Recalling x86-64
## x86-64, Linux, NASM

*This is the first architecture I studied!*

We have:

- Two assembly languages (two diffrent architectures);

- Different conventions;

- Same OS.

## Technical details:

- *Architecture*: x86-64 (a. k. a. AMD64, x64);

- *Encoding*: variable length, 1 - 15 bytes per instruction;

- *Assembler*: NASM, not GAS; **This is really important!**

- *Syntax*: Intel, not AT&T;   **This is really important as well!**

- *Linker*: GNU ld (or GCC);

- *OS*: GNU/Linux (Distro: Ubuntu);

- *Reference file for the x86-64 ABI conventions that I used + comparisons with AArch32*: [`abi_docs.md`](./abi_docs.md)

## What is here

- [`syscalls`](./syscalls) : NASM program that outputs message only using
syscalls, with no libc. Same idea as the ARM lessons;

- [`libc`](./libc) : NASM program that outputs message using libc;

## Getting the setup ready

Everything I wrote runs on a `GNU/Linux` OS (`Ubuntu` distro) with `x86-64`
native CPU architecture. Here is how I set everything up:

```bash
sudo apt install nasm binutils gcc
```

**Building the programs:**

If they are freestanding:

```bash
$ nasm -f elf64 syscalls/hello_world.asm -o hello_world.o
$ ld hello_world.o
$ ./a.out
```

or if they use libc:

```bash
$ nasm -f elf64 libc/printf.asm -o printf.o
$ gcc printf.o -no-pie
$ ./a.out
```

