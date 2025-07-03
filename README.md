# Project Repository: Multi-Language Prototyping Environment

This repository is set up for rapid prototyping in Python, Rust, C, and C++. It includes a basic structure for multi-platform development.

## Original README Content
# leylawoof
Woof!

## Getting Started

1.  **Python**:
    *   Navigate to the `scripts` directory.
    *   Run `./setup_python_env.sh` to create a virtual environment and install dependencies from `src/python/requirements.txt`.
    *   Activate the environment: `source venv_python/bin/activate`.
    *   Run the example: `python src/python/main.py`.

2.  **Rust**:
    *   Ensure Rust and Cargo are installed (see [rustup.rs](https://rustup.rs/)).
    *   Navigate to `src/rust`.
    *   Build: `cargo build`
    *   Run: `cargo run` (or `./target/debug/rust_project`)

3.  **C/C++**:
    *   Ensure you have a C and C++ compiler (e.g., GCC/G++, Clang).
    *   Navigate to the `src` directory.
    *   Build all: `make all` (or `make -C src all` from the root)
    *   Build C program: `make c_program`
    *   Build C++ program: `make cpp_program`
    *   Run C program: `../build/c_program` (from `src` dir) or `./build/c_program` (from root, after building)
    *   Run C++ program: `../build/cpp_program` (from `src` dir) or `./build/cpp_program` (from root, after building)
    *   Clean builds: `make clean`

## Documentation
*   Refer to `src/README.md` for details on multi-platform development strategies.
*   Refer to `LOGGING.md` for the project's logging strategy.
*   Refer to `AGENTS.md` for guidelines on AI agent interaction with this repository.

This project structure and documentation will evolve as development progresses.
