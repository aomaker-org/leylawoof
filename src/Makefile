# Basic Makefile for C and C++ projects
# This is a starting point and can be expanded for platform-specific builds.

CC = gcc
CXX = g++
CFLAGS = -I./c -Wall -Wextra -std=c11
CXXFLAGS = -I./cpp -Wall -Wextra -std=c++17
LDFLAGS =

# Target directories
C_SRC_DIR = c
CPP_SRC_DIR = cpp
BUILD_DIR = ../build # Place build artifacts outside src

# Find source files
C_SOURCES = $(wildcard $(C_SRC_DIR)/*.c)
CPP_SOURCES = $(wildcard $(CPP_SRC_DIR)/*.cpp)

# Object files
C_OBJS = $(patsubst $(C_SRC_DIR)/%.c, $(BUILD_DIR)/c/%.o, $(C_SOURCES))
CPP_OBJS = $(patsubst $(CPP_SRC_DIR)/%.cpp, $(BUILD_DIR)/cpp/%.o, $(CPP_SOURCES))

# Executables
C_TARGET = $(BUILD_DIR)/c_program
CPP_TARGET = $(BUILD_DIR)/cpp_program

.PHONY: all c_program cpp_program clean directories

all: directories c_program cpp_program

directories:
	@mkdir -p $(BUILD_DIR)/c
	@mkdir -p $(BUILD_DIR)/cpp

c_program: $(C_OBJS)
	@echo "Linking C program..."
	$(CC) $(C_OBJS) -o $(C_TARGET) $(LDFLAGS)
	@echo "C program built: $(C_TARGET)"

cpp_program: $(CPP_OBJS)
	@echo "Linking C++ program..."
	$(CXX) $(CPP_OBJS) -o $(CPP_TARGET) $(LDFLAGS)
	@echo "C++ program built: $(CPP_TARGET)"

$(BUILD_DIR)/c/%.o: $(C_SRC_DIR)/%.c
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/cpp/%.o: $(CPP_SRC_DIR)/%.cpp
	@echo "Compiling $<..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	@echo "Cleaning build files..."
	rm -rf $(BUILD_DIR)
	@echo "Clean complete."

# Example usage:
# make -C src all
# make -C src c_program
# make -C src cpp_program
# make -C src clean
