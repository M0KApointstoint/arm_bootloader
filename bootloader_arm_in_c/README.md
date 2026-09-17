# ARM Cortex-M3 Bootloader

A simple bootloader written from scratch for an `ARM Cortex-M3`
(`TI Stellaris LM3S6965`), running in `QEMU`.

On reset it initializes the `C` runtime (`.data` and `.bss`), checks that a
valid application exists at 0x8000, and hands control over to it.

> Current version is written in C with one line of inline assembly.
> The final version will be written fully in ARM (Thumb-2) assembly, see
> [Why assembly for the final version](#why-assembly-for-the-final-version).

## Simple setup

Supposing that you want to run the program on `GNU/Linux` (I use the `Ubuntu`
distro) on a native x86 CPU architecture:

```bash
sudo apt install gcc-arm-none-eabi qemu-system-arm make
make run
```

Expected output:

```bash
$ make run
qemu-system-arm -M lm3s6965evb \
	-kernel build/bootloader.elf \
	-device loader,file=build/app.bin,addr=0x8000 \
	-nographic
Booting...
Copying .data values from FLASH to SRAM...
Done!
Zeroing .bss...
Done!
Welcome, Assembler! Here is a nice number for you: 0xdeadbeef
.data and .bss test code: 0x00000000
Loading application...

 APP STARTED!!! 

```

Exit `QEMU` with `Ctrl-a`, then `x`.


## Memory map

| Address | Size | What lives there |
| ------- | ---- | ---------------- |
| `0x00000000` | 32K | Bootloader (vector table, `.text`, `.rodata`, `.data` load copy) |
| `0x00008000` | 224K | Application (its own vector table first) |
| `0x20000000` | 64K | SRAM (`.data`, `.bss`, stack growing down from `0x20010000`) |
| `0x4000C000` | - | UART0 data register |
| `0xE000ED08` | - | `SCB->VTOR`, vector table offset register |

## Boot flow

- **Reset** : The `Cortex-M3` core reads two words from `0x00000000`: the
initial stack pointer goes into `MSP`, the reset handler address into `PC`.
The address has its lowest bit set (Thumb bit);

- **Copy `.data`** : Initial values are copied from their load address in
`FLASH` (`_sidata`) to `SRAM` (`_sdata` to `_edata`);

- **Zero `.bss`** : Memory from `_sbss` to `_ebss` is zeroed out;

- **Validate the application** : The first word at `0x00008000` (the app's
stack pointer) must point into `SRAM`, and the second word (the app's reset
handler) must not be `0xFFFFFFFF` (erased flash);

- **Relocate the vector table** : `VTOR` is set to `0x00008000`, so exceptions
   now use the application's handlers;

- **Switch stacks and jump** : `MSP` is loaded with the app's stack pointer and
   the CPU branches to the app's reset handler.

## Faults

The fault handlers are oversimplified, printing the fault name. To test the
hard fault handler, uncomment the "About to fault..." block in `reset_handler`,
which calls an invalid address.

## Why assembly for the final version

Assembly doesn't give more **power**, since C with some inline assembly can do
pretty much everything. It gives full *control and visibility*:

- The reset path runs before C's guarantees exist (initialized globals,
  zeroed `.bss`), so writing it in C means running C in a half-ready state;

- The compiler can insert code I didn't write;

- The handoff (load MSP, load reset vector, branch) is three instructions in
  assembly, with no dependence on how the compiler laid out the stack;

- Details like the Thumb bit and exception entry become things I handle
  explicitly instead of trusting the toolchain.

### Pay respect to C

- `Cortex-M` was designed so reset handlers *can* be written in `C`, since the
  hardware loads the stack pointer;

- Real bootloaders are mostly written in `C` with a small assembly startup;

- Complex features are slower to write and easier to get wrong in assembly;

- It's easier to learn about what the bootloader does starting from `C`.

*I still love C <3.*

## How I did this

I added two conversations that I had with AI systems that helped me write the
bootloader from scratch.

**The final project done in `ARM Assembly` is fully written by *me*.**

