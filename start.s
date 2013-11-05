
.section 	.startup
.code 		32
.align 		0

.global 	_start

//interrupt vector
_start:
	//ldr 	pc, _vector_reset
	b 		_vector_reset
	ldr 	pc, _vector_undefined
	ldr 	pc, _vector_swi
	ldr 	pc, _vector_prefetch_abort
	ldr 	pc, _vector_data_abort
	ldr 	pc, _vector_reserved
	ldr 	pc, _vector_irq
	ldr 	pc, _vector_fiq

.align 	4

_vector_reset:
	.word	__vector_reset
_vector_undefined:
	.word 	__vector_undefined
_vector_swi:
	.word 	__vector_swi
_vector_prefetch_abort:
	.word 	__vector_prefetch_abort
_vector_data_abort:
	.word 	__vector_data_abort
_vector_reserved:
	.word 	__vector_reserved
_vector_irq:
	.word 	__vector_irq
_vector_fiq:
	.word 	__vector_fiq

__vector_reset:
	@ Peri port setup
	ldr 	r0, =0x70000000
	orr 	r0, r0, #0x13
	mcr 	p15, 0, r0, c15, c2, 4

	@ disable watchdog
	ldr		r0, =0x7e004000
	ldr 	r1, =0x0
	str 	r1, [r0]

	@ stack
	ldr 	sp, =8*1024

	@ initialize clock
	bl 		clock_init

	@ initialize sdram
	bl 		sdram_init

	@ copy to sdram










