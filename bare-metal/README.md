# Bare-metal C for ARM architecture

**Tools:**

```bash
$ sudo apt install qemu-system-arm
$ sudo apt install gcc-arm-none-eabi
$ sudo apt install build-essential
$ sudo apt install cmake
$ sudo apt install bison
$ sudo apt install flex
```

**Starting:**

```bash
$ qemu-system-arm -M vexpress-a9 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:1234,server,nowait
```

**Compiling:**

```bash
$ arm-none-eabi-as startup.s -o startup.o
$ arm-none-eabi-ld startup.o -o first-hang.elf
```

**Converting ELF to raw binary:**

```bash
$ arm-none-eabi-objcopy first-hang.elf -O binary first-hang.bin
```

**Loading the binary into QEMU:**

*First terminal:*

```bash
$ qemu-system-arm -M vexpress-a9 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:1234,server,nowait -kernel first-hang.bin
```

*Second terminal:*

```bash
$ telnet localhost 1234
$ (qemu) info registers
```

