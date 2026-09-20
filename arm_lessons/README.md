# Learning ARM
## AArch32, Linux, GNU as

Some documentation of the learning process that I had to go through while
learning `ARM Assembly`.

This work leads nicely to these directories:

- [`x86-64_recall`](../x86-64_recall) : Recalling `x86` knowledge and comparing
it with fresh `ARM` skills;

- [`bootloader_arm_assembly`](../bootloader_arm_assembly) : The main project of
this repository;

- [`boot_sector_x86`](../boot_sector_x86) : What kind of
[Asemblerist](https://translate.google.com/?sl=ro&tl=en&text=asemblerist&op=translate)
am I?. Wrote a simple boot sector for `x86` as well!

- [`bootloader_arm_in_c`](../bootloader_arm_in_c) : Main project, but in `C`.

## Technical details

- *Architecture*: AArch32 (32-bit ARM);

- *Instruction set*: A32(the "ARM" instruction set), not Thumb/T32;

- *Encoding*: fixed length, 4 bytes per instruction;

- *Assembler*: GNU as;

- *Syntax*: ARM/GAS;

- *Linker*: GNU ld;

- *OS*: GNU/Linux (Distro: Ubuntu);

- *Runtime*: x86-64 host + qemu-arm;

- *Reference file for the AArch32 ABI conventions that I used while learning*: [`abi_docs.md`](./abi_docs.md)

## Credits

I am so happy that creators such as
[LaurieWired](https://www.youtube.com/@lauriewired) and
[Low Level](https://www.youtube.com/@LowLevelTV) exist, because
the first tutorials that I learned from can be found publicly
on their `Youtube` channels.
*Thank you!*

## Lessons

For each lesson starting from `00` to `11` I have followed along these videos:

- [`00_miscellaneous_programs`](./00_miscellaneous_programs):
[You Can Learn ARM Assembly Language in 15 Minutes | ARM Hello World Tutorial](https://www.youtube.com/watch?v=FV6P5eRmMh8)

- [`01_mov_and_exit`](./01_mov_and_exit):
[ARM Assembly: Lesson 1 (MOV, Exit Syscall)](https://www.youtube.com/watch?v=kKtWsuuJEDs)

- [`02_arithmetic_and_cpsr`](./02_arithmetic_and_cpsr):
[ARM Assembly: Lesson 2 (ADD, SUB, MUL, set CPSR)](https://www.youtube.com/watch?v=xQ--xX9rHeE)

- [`03_memory_access`](./03_memory_access):
[ARM Assembly: Lesson 3 (LDR, STR)](https://www.youtube.com/watch?v=fJcdt7WMQCs)

- [`04_logical_operators`](./04_logical_operators):
[ARM Assembly: Lesson 4 (Logical Operators)](https://www.youtube.com/watch?v=IJw1wm3Kb0Q)

- [`05_signed_number_conversions`](./05_signed_number_conversions):
[ARM Assembly: Lesson 5 (Signed Number Conversions)](https://www.youtube.com/watch?v=9wvzEOq1imo)

- [`06_shifts_and_rotates`](./06_shifts_and_rotates):
[ARM Assembly: Lesson 6 (Shift and Rotate)](https://www.youtube.com/watch?v=aGJm3fuKLhA)

- [`07_compare_and_flags`](./07_compare_and_flags):
[ARM Assembly: Lesson 7 (CMP)](https://www.youtube.com/watch?v=nDGy-PQ1gVs)

- [`08_branching`](./08_branching):
[ARM Assembly: Lesson 8 (Branching)](https://www.youtube.com/watch?v=VeDPnWA_GVI)

- [`09_while_loops`](./09_while_loops):
[ARM Assembly: Lesson 9 (While Loops)](https://www.youtube.com/watch?v=rg3aBTjsUms)

- [`10_function_calls`](./10_function_calls):
[ARM Assembly: Lesson 10 (Function Calls)](https://www.youtube.com/watch?v=pnnOL7kfkz0)

- [`11_stack_operations`](./11_stack_operations):
[ARM Assembly: Lesson 11 (Stack Operations)](https://www.youtube.com/watch?v=56VrSY-F7_o)

## Practice

Besides watching tutorials while searching for things I did not understand and
writing code, I also wanted to write some programs by myself having an AI
system giving me tasks and evaluating my solutions. You can find this work
here: [`ARM_practice`](./ARM_practice)

## Getting the setup ready for a machine that does not have native ARM:

Everything I wrote runs on a `GNU/Linux` OS (`Ubuntu` distro) with `x86-64`
native CPU architecture. Here is how I set everything up:

```bash
sudo apt install binutils-arm-linux-gnueabihf qemu-user gdb-multiarch
```

**I also learned about cross-compiliing and emulators while doing this.**

You can test that everything works in two ways:

```bash
$ arm-linux-gnueabihf-as 00_miscellaneous_programs/welcome_assembler.s -o welcome_assembler.o
$ arm-linux-gnueabihf-ld welcome_assembler.o
$ qemu-arm ./a.out
```

or using the bash script:

```bash
$ ./scripts/assemble_link_run.sh 00_miscellaneous_programs/welcome_assembler.s
```

## Other

- [`italy`](./italy) : Code that I wrote after an Italy break to refresh my knowledge;

- [`scripts`](./scripts) : Bash scripts that I wrote to automate my work.

