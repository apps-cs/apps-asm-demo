TARGET=c-main

ARCH=64

ifeq ($(ARCH), 32)
CFLAGS += -m32
endif

CFLAGS += $(shell gcc -v 2>&1 | grep enable-default-pie > /dev/null && echo \-no\-pie)
CFLAGS += -g -std=c99
LDFLAGS += -z noexecstack

all: $(TARGET)

%.o: %.asm
	nasm -g -f elf$(ARCH) -Fdwarf $<

clean:
	rm -rf $(TARGET) *.o

$(TARGET): asm-module.o c-main.c
	cc $(CFLAGS) asm-module.o c-main.c -o $(TARGET) $(LDFLAGS)

