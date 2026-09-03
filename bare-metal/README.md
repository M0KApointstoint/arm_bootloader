# Bare-metal C for ARM architecture

## Chapter 1

**Tools:**

```bash
$ sudo apt install qemu-system-arm
$ sudo apt install gcc-arm-none-eabi
```

## Chapter 2

### First and simple version

**Assembling and linking:**

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
$ (qemu) q
```

### Second and better version

*First terminal*

```bash
$ arm-none-eabi-as better.s -o better.o
$ arm-none-eabi-ld -T linkscript.ld better.o -o better-hang.elf
$ arm-none-eabi-objcopy better-hang.elf -O binary better-hang.bin
$ qemu-system-arm -M vexpress-a9 -m 32M -no-reboot -nographic -monitor telnet:127.0.0.1:1234,server,nowait -kernel better-hang.bin
```

*Second terminal*

```bash
$ telnet localhost 1234
$ (qemu) info registers
$ (qemu) q
```
## Chapter 3

*Coming soon!*

