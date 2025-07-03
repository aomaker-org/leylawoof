# Agent Interaction Guidelines for This Repository

This document provides guidelines for AI agents (like Jules) interacting with this repository.

## General Principles

1.  **Understand the Goal**: This is a rapid prototyping repository. Speed of iteration and exploration of different technologies (Python, Rust, C, C++) and platforms (x86, ARM, GPU, embedded) are key.
2.  **Additive Changes**: Prefer adding new files or functionalities rather than extensive refactoring of existing placeholder code, especially in early stages. The structure is meant to be a template that can be copied and adapted.
3.  **Modularity**: Keep language-specific and platform-specific concerns as isolated as possible. Use the `src/<language>` and `src/platform/<platform_name>` structures.
4.  **Best Practices**: While speed is important, always strive to suggest and implement best practices for each language and technology (e.g., venv for Python, cargo for Rust, Makefiles/CMake for C/C++, proper logging).
5.  **Documentation**:
    *   Document new scripts, build processes, or complex configurations.
    *   Update the main `README.md`, `src/README.md` (for multi-platform), and `LOGGING.md` as new patterns or tools are introduced.
6.  **Planning**:
    *   Always create a plan (`set_plan`) before making changes.
    *   Break down tasks into manageable steps.
    *   If a plan needs to change significantly, update it and inform the user.
7.  **Tool Usage**:
    *   Use `run_in_bash_session` for installations, compilations, and running scripts.
    *   Use file manipulation tools (`create_file_with_block`, `replace_with_git_merge_diff`, etc.) correctly.
    *   If a tool fails, try to understand why and find an alternative approach if necessary.

## Specific Instructions

1.  **Python**:
    *   Use the `scripts/setup_python_env.sh` script to manage virtual environments. Ensure it's used or referenced when discussing Python environments.
    *   Add dependencies to `src/python/requirements.txt`.
2.  **Rust**:
    *   Use `cargo` for building and managing Rust projects within `src/rust`.
    *   Adhere to standard Rust project structure.
3.  **C/C++**:
    *   Use the `Makefile` in `src` for building C and C++ code.
    *   Extend the `Makefile` to support new platforms or build configurations. If `CMake` becomes preferred, assist in migrating.
    *   Place build artifacts in a `build` directory outside `src`.
4.  **Multi-Platform**:
    *   Refer to `src/README.md` for the multi-platform strategy.
    *   When adding support for a new platform (e.g., "arduino", "pocketbeagle", "gpu"), update `src/README.md` and the relevant build systems.
    *   Platform-specific code should be conditionally compiled or placed in dedicated subdirectories.
5.  **Logging**:
    *   Adhere to the principles in `LOGGING.md`.
    *   Implement or suggest logging mechanisms for new components.
6.  **Branching and Committing**:
    *   For significant new features or platform additions, work on a new branch. The user might suggest datestamped or feature-specific branches.
    *   Write clear and concise commit messages.
7.  **"Independent" Subfolder Trees**:
    *   The user may request creating "independent" subfolder trees, possibly by copying the existing structure as a template for a new, distinct prototype. Assist with this by duplicating relevant parts of the directory structure and build files as a starting point for the new tree.

## Things to Avoid

*   Do not ask the user to perform manual installations or environment setup that you can do via `run_in_bash_session`.
*   Do not commit secrets or large binary files.
*   Do not make major architectural changes without discussing and updating the plan.

This `AGENTS.md` can be updated as the project evolves. If you have suggestions for improving these guidelines, please propose them.
