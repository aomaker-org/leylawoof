# Multi-Platform Development Strategy

This document outlines the strategy for managing multi-platform builds and development within this repository.

## Core Principles

1.  **Source Code Organization**:
    *   Language-specific code resides in its respective directory (`python`, `rust`, `c`, `cpp`).
    *   Platform-specific code within a language should be conditionally compiled or organized into subdirectories if it becomes substantial.

2.  **Build System**:
    *   **C/C++**: The `Makefile` (or a `CMakeLists.txt` if preferred later) in the `src` directory will be the primary tool. It should be designed to:
        *   Accept platform targets (e.g., `make PLATFORM=x86_64`, `make PLATFORM=arm_cortex_m4`).
        *   Use platform-specific compiler flags, libraries, and include paths.
        *   Potentially use different toolchains (e.g., cross-compilers for ARM, Arduino).
    *   **Rust**: Cargo handles many cross-compilation aspects. Configuration will be managed via `.cargo/config.toml` and target flags (`cargo build --target <target_triple>`).
    *   **Python**: Python is generally platform-independent, but dependencies might have platform-specific compiled components. `requirements.txt` should list compatible versions. For embedded platforms, a custom Python build or MicroPython might be used, requiring separate environment setup.

3.  **Platform Identification**:
    *   A consistent naming scheme for platforms should be used (e.g., `x86_64`, `aarch64`, `armv7l`, `esp32`, `atmega328p`).
    *   Build scripts and Makefiles will use these identifiers to switch configurations.

## Platform-Specific Directories and Configuration

*   **`src/<language>/platform/<platform_name>`**: For significant amounts of platform-specific source code that cannot be handled by conditional compilation alone.
*   **`config/<platform_name>`**: For platform-specific configuration files, linker scripts, or other assets.
*   **`scripts/platform/<platform_name>`**: For platform-specific build helper scripts, flashing utilities, etc.

## Example: Arduino (atmega328p)

*   **Toolchain**: `avr-gcc`, `avrdude`.
*   **Makefile**: A target `make PLATFORM=arduino_uno` could:
    *   Set `CC = avr-gcc`.
    *   Include Arduino core libraries.
    *   Define specific CFLAGS for the AVR microcontroller.
    *   Invoke `avrdude` to upload the compiled hex file.
*   **Source**: C/C++ code in `src/c` or `src/cpp` might use `#ifdef ARDUINO_UNO` for Arduino-specific logic.

## Example: PocketBeagle (ARM - am335x)

*   **Toolchain**: ARM cross-compiler (e.g., `arm-linux-gnueabihf-gcc`).
*   **Makefile**: A target `make PLATFORM=pocketbeagle` could:
    *   Set the appropriate cross-compiler.
    *   Link against specific libraries for the PocketBeagle.
*   **Rust**: `cargo build --target armv7-unknown-linux-gnueabihf`. Requires the target to be installed via `rustup target add armv7-unknown-linux-gnueabihf`.

## GPU Considerations

*   **CUDA (NVIDIA)**:
    *   Requires the NVIDIA CUDA Toolkit.
    *   C/C++: `nvcc` compiler. The Makefile would need rules for `.cu` files.
    *   Python: Libraries like `cupy`, `numba`, `tensorflow-gpu`, `pytorch-cuda`.
*   **OpenCL (Cross-platform)**:
    *   Requires OpenCL SDK and drivers for the target GPU.
    *   C/C++: Link against OpenCL libraries.
*   **Build System**: The build system should detect the presence of GPU SDKs and enable GPU-specific build targets or flags accordingly.

## Next Steps

*   Flesh out the `Makefile` or choose a build system like CMake for C/C++ to better handle cross-compilation and platform targets.
*   Develop specific build configurations and scripts for each target platform as they are introduced.
*   Set up CI (e.g., GitHub Actions) to build for multiple target platforms.

This document will evolve as the project grows and more platforms are actively targeted.
