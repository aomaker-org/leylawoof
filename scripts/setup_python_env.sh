#!/bin/bash

# Script to set up and manage Python virtual environments

PYTHON_ENV_DIR="venv_python"

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found, please install it."
    exit 1
fi

# Create virtual environment
if [ ! -d "$PYTHON_ENV_DIR" ]; then
    echo "Creating Python virtual environment in $PYTHON_ENV_DIR..."
    python3 -m venv "$PYTHON_ENV_DIR"
else
    echo "Python virtual environment already exists in $PYTHON_ENV_DIR."
fi

# Activate virtual environment (example for bash/zsh)
# To activate, run: source venv_python/bin/activate
echo "To activate the Python virtual environment, run: source $PYTHON_ENV_DIR/bin/activate"

# Install requirements
if [ -f "src/python/requirements.txt" ]; then
    echo "Installing dependencies from src/python/requirements.txt..."
    # Ensure pip is up-to-date in the venv
    "$PYTHON_ENV_DIR/bin/python" -m pip install --upgrade pip
    "$PYTHON_ENV_DIR/bin/python" -m pip install -r src/python/requirements.txt
else
    echo "src/python/requirements.txt not found. No dependencies to install."
fi

echo "Python environment setup complete."
echo "Remember to activate the environment using: source $PYTHON_ENV_DIR/bin/activate"
