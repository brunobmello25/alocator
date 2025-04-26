# ───────────────────────────────────────────────────────
# Makefile wrapper around CMake
# ───────────────────────────────────────────────────────
# Name of your executable (must match add_executable in CMakeLists.txt)
TARGET := alocator

# Where to do the out-of-source build
BUILD_DIR := build

# CMake generator options
CMAKE_CFG := -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# The CMake binary (could be cmake3 on some distros)
CMAKE := cmake

# ───────────────────────────────────────────────────────
.PHONY: all configure build run clean

# Default target: configure + build
all: configure build

# 1) run CMake configure (only once or whenever CMakeLists.txt changes)
configure:
	@mkdir -p $(BUILD_DIR)
	@$(CMAKE) $(CMAKE_CFG) -B $(BUILD_DIR) -S .

# 2) actually build the target
build:
	@$(CMAKE) --build $(BUILD_DIR)

# 3) run the resulting binary
run: all
	@$(BUILD_DIR)/$(TARGET)

# wipe out the build dir
clean:
	@rm -rf $(BUILD_DIR)
