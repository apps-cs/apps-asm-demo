TARGET=c-main

CFLAGS += $(shell gcc -v 2>&1 | grep enable-default-pie > /dev/null && echo \-no\-pie)
CFLAGS += -g -std=c99
#CFLAGS += -m32

all: $(TARGET)

%.o: %.asm
	nasm -g -f elf64 -Fdwarf $<

clean:
	rm -rf $(TARGET) *.o

$(TARGET): asm-tool.o c-main.c
	cc $(CFLAGS) asm-tool.o c-main.c -o $(TARGET)
