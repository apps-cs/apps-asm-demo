TARGET=c-main

#CFLAGS += $(shell gcc -v 2>&1 | grep enable-default-pie > /dev/null && echo \-no\-pie)
CFLAGS += -g -std=c99
#CFLAGS += -m32

all: $(TARGET)

clean:
	rm -rf $(TARGET) *.o

$(TARGET): c-module.c c-main.c
	cc $(CFLAGS) c-module.c c-main.c -o $(TARGET)
