.global _start

.text
_start:
	mov r0, #1
	mov r1, #2

	push {r0, r1} // Save register values on the stack.

	bl sum // Branch with link -> Sets the link register.
	// lr stores the address of the instruction to execute after function call.

	mov r2, r0 // Save return value.

	pop {r0, r1} // Restore register values.

	mov r7, #1
	mov r0, r2
	swi 0

sum:
	add r0, r0, r1
	bx lr // Branch and exchange.

// Similar C code:

/*
	int sum(int x, int y)
	{
		return x + y;
	}

	int main(void)
	{
		sum(1, 2);
		return 0;
	}
*/

// Convention used:
// - First four arguments are stored in r0 - r3.
// - Rest of the arguments are stored on the stack.
// - Return value is stored in r0.

// Should look more on calling conventions.

