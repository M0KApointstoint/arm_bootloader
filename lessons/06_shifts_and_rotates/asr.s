.global _start

.text
_start:
	mov r0, #0
	mov r1, #-2
	asr r0, r1, #1 // r0 = r1 ASR 1 (Keep the sign bit); r1 = r1

	mov r7, #1
	mov r0, r1
	swi 0

