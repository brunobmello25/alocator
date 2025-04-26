# Compiler and flags
CC      := gcc
CFLAGS  := -Wall -Wextra -Iinclude -g

# Directories
SRC_DIR := src
INC_DIR := include

# Find all .c sources under src/
SRCS    := $(wildcard $(SRC_DIR)/*.c)
# Create corresponding .o names
OBJS    := $(SRCS:.c=.o)

# Final executable name
TARGET  := alocator

.PHONY: all run clean

all: $(TARGET)

# Link step
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Compile step
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Convenience: build and run
run: all
	./$(TARGET)

clean:
	rm -f $(SRC_DIR)/*.o $(TARGET)
