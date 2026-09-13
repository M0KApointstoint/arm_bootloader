# Evaluation
## By Claude Opus 5

- Alignment under n. Your string is 19 bytes, plus the .byte 0 makes 20,
which happens to be divisible by 4. So ldr r0, [r0] works — by luck.
Change one character in the string and n becomes misaligned.
Put .align 2 before it and stop depending on the coincidence.

- The .byte 0 does nothing. It's after the end_string label,
so it isn't counted in the length, and you're not using NUL-termination
anyway since you compute the size. Delete it.

- You recompute the length on every iteration. end_string - string is
known at assembly time — the assembler can do the subtraction once instead
of your CPU doing it 69 times.

