# First evaluation
## By Claude Opus 5


### WHAT IT DOES

Calls nanosleep(162) for 1 second, then exits cleanly via exit(1).
Runs correctly. Verify with: time ./sleep

### CORRECT

- Syscall number in r7, args in r0/r1 - right convention

- ldr r0, =struct_var - correct way to get an address

- Exit path present, no fall-through past the end

- .data used rather than .rodata - right call, the kernel may
write to the rem struct

- Comment documents where the struct definition came from -
good habit, keep doing this

### TO FIX

- r1 must be 0, not a pointer to your own struct.
r1 is the "remaining time" output. The kernel writes there
if a signal interrupts the sleep, which would corrupt your
input. Change to:  mov r1, #0

- Struct is 2 words, not 4.
32-bit ARM uses struct timespec: tv_sec, tv_nsec, both 4 bytes.
Change to:  .word 1, 0
(`__kernel_timespec is the 64-bit-time struct - not this syscall`)

### STYLE

- #0xa2 -> #162       decimal matches the tables you look it up in
- // -> @             ARM comment convention

### TAKEAWAY

- Syscall number from a table. Struct layout from man 2.
The program worked despite the wrong struct only because
1 second encodes identically in both layouts. At 500ms it
would not have.

# Second evaluation

- Structurally this is right. Two functions' worth of separation,
blank lines grouping operations, a real parameterized print with
an interface. That's a big step up from the first program.

- The r4/r5 detour is unnecessary. You save r0 and r1 into r4/r5,
then immediately copy them back into r1/r2. The values never
needed protecting — nothing happens between the save and the restore.
You can shuffle directly.

- Order matters: move r1 into r2 before overwriting r1. Get it backwards
and you copy the buffer pointer into both. That's the entire trick, and it's
the same problem as swapping two variables without a temp.

- With the push gone, print is now a leaf function that touches no callee-saved
registers — nothing to preserve at all.

- Also rename fmt to buf or msg — fmt means format string, and there's
noformatting here.

