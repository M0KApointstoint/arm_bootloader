# ARM Practice

## Main idea

- Used `Claude Opus 5` to generate a task for me to solve;

- The solution was then reviewed by `Claude Opus 5` resulting in a README.md
file;

- I rewrote a better version of the program (better.s);

- Both versions of the program are kept to emphasize the evolution;

- All of the programs are freestanding, written in ARM assembly, no AI code;

- Learn to use syscalls / structs with documentation that did not come from AI-
e.g., `nanosleep` syscall with `timespec` struct.

## Tasks and main things I got wrong

- [`print_string_n_times`](./1_program) :

- Relied on the string happening to be 4-byte aligned;

- Computed the length at runtime instead of at assembly time.

- [`print_sleep_repeat`](./2_program) :

- Built the `timespec` struct with the wrong layout;

- Saved registers that did not need saving.

- [`reverse_string_in_place`](./3_program) :

- Called a function without saving lr first, so destroyed the return address.

- [`real_countdown`](./4_program) :

- Nothing. Prepared for the next step.

## Debugging

The lr bug in program 3 was found with a debugger, didn't work to just stare at
the code. The notes on attaching gdb-multiarch to a qemu-arm process are here:
[`gdb_arm.md`](./3_program/gdb_arm.md).

## Build and run

```bash
$ arm-linux-gnueabihf-as 1_program/better.s -o better.o
$ arm-linux-gnueabihf-ld better.o
$ qemu-arm ./a.out
```

