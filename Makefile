CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
OBJDUMP = arm-none-eabi-objdump
CFLAGS = -g
ASFLAGS = -g
LDFLAGS = -Tos.lds -Text 0x0 

OBJS = start.o helloworld.o

all: os.bin

os.bin: OBJS
	$(CC) -static -nostartfiles -nostdlib $(LDFLAGS) $? -o $@ -lgcc
	$(OBJCOPY) -O binary $@ os.bin
	$(OBJDUMP) -D os.elf > os.dis

%.o: %.c
	$(CC) $(CFLAGS) -c $<
	
%.o: %.s
	$(CC) $(ASFLAGS) -c $<

.PHONY: clean
clean:
	rm *.o os os.bin $(OBJS) -f