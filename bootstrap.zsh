#!/usr/bin/env zsh
#
# bootstrap.zsh

###############################################################################
# webex Project Bootstrap
#
###############################################################################

set -euo pipefail

PROJECT_ROOT="${PROJECT_ROOT:-$(pwd)}"

###############################################################################
# Pretty printing
###############################################################################

info() {
    printf "\033[1;34m==>\033[0m %s\n" "$1"
}

success() {
    printf "\033[1;32m✔\033[0m %s\n" "$1"
}

warn() {
    printf "\033[1;33m⚠\033[0m %s\n" "$1"
}

###############################################################################
# Helpers
###############################################################################

create_dir() {

    local dir="$PROJECT_ROOT/$1"

    if [[ -d "$dir" ]]; then
        warn "Directory exists : $1"
    else
        mkdir -p "$dir"
        success "Created directory : $1"
    fi
}

create_file() {

    local file="$PROJECT_ROOT/$1"

    if [[ -f "$file" ]]; then
        warn "File exists      : $1"
    else
        touch "$file"
        success "Created file     : $1"
    fi
}

create_file_with_header() {
    local file="$PROJECT_ROOT/$1"

    if [[ ! -f "$file" ]]; then
        cat > "$file" <<EOF
###############################################################################
# $2
# Copyright (c) 2026 Vladimir Lekic
#
###############################################################################
EOF
        success "Created file     : $1"
    else
        warn "File exists      : $1"
    fi
}

###############################################################################
# Main
###############################################################################

info "Project root"

echo "    $PROJECT_ROOT"
echo

###############################################################################
# Directories
###############################################################################

info "Creating directories"

create_dir "webex"
create_dir "tests"

echo

###############################################################################
# Top-level files
###############################################################################

info "Creating top-level files"

create_file ".gitignore"
create_file "LICENSE"
create_file "README.md"
create_file "VERSION"

create_file_with_header "pyproject.toml" "Python project configuration"

echo

###############################################################################
# Python package
###############################################################################

info "Creating Python package"

create_file_with_header "webex/__init__.py" "Python package initializer"
create_file_with_header "webex/__main__.py" "Main entry point for the package"

create_file_with_header "webex/cli.py" "Command-line interface"
create_file_with_header "webex/generator.py" "Configuration generation"
create_file_with_header "webex/fetcher.py" "Data fetching"
create_file_with_header "webex/extractor.py" "Data extraction"
create_file_with_header "webex/writer.py" "Data writing"
create_file_with_header "webex/models.py" "Data models"
create_file_with_header "webex/pipeline.py" "Data processing pipeline"

echo

###############################################################################
# Initialise files
###############################################################################

info "Initialising VERSION"

VERSION_FILE="$PROJECT_ROOT/VERSION"

if [[ ! -s "$VERSION_FILE" ]]; then
    echo "0.1.0" > "$VERSION_FILE"
    success "Initialised VERSION"
else
    warn "VERSION already initialised"
fi

echo

###############################################################################
# Make scripts executable
###############################################################################

info "Making scripts executable"

chmod +x "$PROJECT_ROOT/webex" 2>/dev/null || true

success "Executable permissions set"

echo
success "Bootstrap complete."
echo

cat <<EOF
Project structure:

webex/
├── pyproject.toml
├── README.md
│
├── webex/
│   ├── __init__.py
│   ├── __main__.py
│   ├── cli.py
│   │
│   ├── generator.py
│   ├── fetcher.py
│   ├── extractor.py
│   ├── writer.py
│   ├── models.py
│   └── pipeline.py
│
└── tests/
EOF
