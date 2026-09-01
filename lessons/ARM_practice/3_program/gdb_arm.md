# Remote debugging:

**Terminal 1:**
```bash
$ qemu-arm -g 1234 ./a.out
```

**Terminal 2:**
```bash
$ gdb-multiarch ./a.out
$ target remote :1234
```

