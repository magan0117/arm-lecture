	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

	mov r3, #-1    	@int previous = -1;
    	mov r4, #1    	@int result = 1;
    	mov r5, #0    	@int i=0;
	mov r6, #0		@int sum=0;
	
	cmp r0, #0		@if(x = 0)
	beq IsZero
	
	cmp r0, #1		@if(x = 1)
	beq IsOne
		
ForLoop:	
	add r6, r4, r3	@sum = result + previous;
	mov r3, r4	@previous = result;
	mov r4, r6	@result = sum;
	add r5, r5, #1	@i=i+1
	
	cmp r5, r0		@if (i<=x)
	ble ForLoop		@go back to ForLoop
	
	mov r0,r6
	pop {r3, r4, r5, r6,  pc}
	
	
IsZero:
	mov r0, #0
	pop {r3, r4, r5, r6, pc}

IsOne:
	mov r0, #1
	pop {r3, r4, r5, r6, pc}

	.size fibonacci, .-fibonacci
	.end
