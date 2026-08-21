.global _start

.text
_start:
	mov r0, #1
	mov r1, #1
	ror r0, r1, #1 // r0 = r1 ROR 1; r1 = r1; ROAR!!! THEY DON'T HAVE ROL!!!
	// Thankfully, math exists:
	ror r0, r0, #31

	mov r7, #1
	swi 0

// Also, there is the RRX instruction but it needs CPSR knowledge.

