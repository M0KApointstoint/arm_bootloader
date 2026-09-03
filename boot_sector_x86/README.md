# Bootloader
## From scratch

*In progress...*

```bash
$ make
$ qemu-system-x86_64 -fda build/boot_floppy.img -monitor stdio
$ (qemu) info registers
```

### Important notes:

**Referencing a memory location:**

```text
segment:[offset]

physical address = segment * 16 + offset

segment:[base + index * scale + displacement]
```

*All fields are optional:*

```text
segment: CS, DS, ES, FS, GS, SS
    If the base register is BP, the CPU defaults to SS, otherwise to DS

base: (16 bits) BP / BX
      (32 / 64 bits) any general purpose register

index: (16 bits) SI / DI
       (32 / 64 bits) any general purpose register

scale: (32 / 64 bits only) 1, 2, 4, 8


displacement: a (signed) constant value
```

[BIOS interrupts](https://wiki.osdev.org/BIOS)

