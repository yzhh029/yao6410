OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)

ENTRY(_start)
SECTIONS
{
	. = 0x00000000;
	. = ALIGN(4);
	.text :
	{
		*(.startup)
		*(.text)
	}
	. = ALIGN(4);
	
	.rodata : 
	{ 
		*(.rodata) 
	} 

 	. = ALIGN(4);
	
	.data :
	{
		*(.data)
	}
	
	. = ALIGN(32);
	__bss_start__ = .;
	.bss :
	{
		*(.bss)
	}
	__bss_end__ = .;
}