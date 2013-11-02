.text
.code 	32

.global 	__vector_reset

.extern plat_boot
.extern __bss_start__
.extern __bss_end__

__vector_reset:
	msr 	cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
	ldr 	sp, =_SVC_STACK

	msr 	cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
	ldr 	sp, =_SVC_STACK

	msr 	cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
	ldr 	sp, =_SVC_STACK

	msr 	cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
	ldr 	sp, =_SVC_STACK

	msr 	cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
	ldr 	sp, =_SVC_STACK

	msr 	cpsr_c, #(DISABLE_IRQ | DISABLE_FIQ | SVC_MOD)
	ldr 	sp, =_SVC_STACK
