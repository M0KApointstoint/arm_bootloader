.global _start

.text
_start:
	// mov r1, #0xff00ff00; Interesting error discovered.
	mov r1, #0xffffff00
	orr r0, r1, #0x000000ff // r0 = r1 | 0x000000ff; r1 = r1; What a name.

	mov r7, #1
	swi 0

