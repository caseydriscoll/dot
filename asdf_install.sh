#!/bin/bash

# https://asdf-vm.com/guide/getting-started.html#_1-install-asdf

set -euo pipefail

# ============================================================================
# Global Variables
# ============================================================================

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m' # No Color

# Installation settings
ASDF_DIR="/opt/asdf"
SYSTEM_WIDE=true
TEMP_DIR=""
LATEST_VERSION=""
ARCH_SUFFIX=""
DOWNLOAD_URL=""
ARCHIVE_NAME=""

# ============================================================================
# Logging Functions
# ============================================================================

log_info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
  echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# ============================================================================
# Utility Functions
# ============================================================================

show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --user           Install for current user in ~/.asdf"
  echo "  --all-users      Install for all users in /opt/asdf (default, requires sudo)"
  echo "  --asdf-dir PATH  Custom installation directory"
  echo "  -h, --help       Show this help message"
}

parse_arguments() {
  while [[ $# -gt 0 ]]; do
    case $1 in
      --all-users)
        SYSTEM_WIDE=true
        ASDF_DIR="/opt/asdf"
        shift
        ;;
      --user)
        SYSTEM_WIDE=false
        ASDF_DIR="${HOME}/.asdf"
        shift
        ;;
      --asdf-dir)
        ASDF_DIR="$2"
        shift 2
        ;;
      -h|--help)
        show_help
        exit 0
        ;;
      *)
        log_error "Unknown option: $1"
        echo "Use -h or --help for usage information"
        exit 1
        ;;
    esac
  done
}

cleanup() {
  if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
    log_info "Cleaning up temporary directory..."
    rm -rf "$TEMP_DIR"
  fi
}

trap cleanup EXIT

# ============================================================================
# Validation Functions
# ============================================================================

check_prerequisites() {
  log_info "Checking prerequisites..."

  if [[ "$SYSTEM_WIDE" == true ]] && [[ $EUID -ne 0 ]]; then
    log_error "System-wide installation (--all-users) requires sudo"
    exit 1
  fi

  for cmd in curl tar; do
    if ! command -v "$cmd" &> /dev/null; then
      log_error "$cmd is required but not installed"
      exit 1
    fi
  done

  log_info "All prerequisites met"
}

# ============================================================================
# Download and Setup Functions
# ============================================================================

fetch_latest_version() {
  log_info "Fetching latest asdf release information..."

  local release_data
  release_data=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest)

  LATEST_VERSION=$(echo "$release_data" | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')

  if [[ -z "$LATEST_VERSION" ]]; then
    log_error "Failed to fetch latest asdf version"
    exit 1
  fi

  log_info "Latest asdf version: v${LATEST_VERSION}"
}

detect_architecture() {
  log_info "Detecting system architecture..."

  local arch
  arch=$(uname -m)

  case "$arch" in
    x86_64)
      ARCH_SUFFIX="linux-amd64"
      ;;
    aarch64)
      ARCH_SUFFIX="linux-arm64"
      ;;
    armv7l)
      ARCH_SUFFIX="linux-armv7"
      ;;
    *)
      log_error "Unsupported architecture: $arch"
      exit 1
      ;;
  esac

  log_info "Architecture: ${arch} (${ARCH_SUFFIX})"
}

prepare_download() {
  DOWNLOAD_URL="https://github.com/asdf-vm/asdf/releases/download/v${LATEST_VERSION}/asdf-v${LATEST_VERSION}-${ARCH_SUFFIX}.tar.gz"
  ARCHIVE_NAME="asdf-v${LATEST_VERSION}-${ARCH_SUFFIX}.tar.gz"
  TEMP_DIR=$(mktemp -d)

  log_info "Download URL: $DOWNLOAD_URL"
  log_info "Temporary directory: $TEMP_DIR"
}

download_asdf() {
  log_info "Downloading asdf v${LATEST_VERSION}..."

  if ! curl -L -o "${TEMP_DIR}/${ARCHIVE_NAME}" "$DOWNLOAD_URL"; then
    log_error "Failed to download asdf"
    exit 1
  fi

  log_info "Downloaded successfully to ${TEMP_DIR}/${ARCHIVE_NAME}"
}

create_installation_directory() {
  log_info "Preparing installation directory: $ASDF_DIR"

  if [[ ! -d "$ASDF_DIR" ]]; then
    if [[ "$SYSTEM_WIDE" == true ]]; then
      sudo mkdir -p "$ASDF_DIR"
    else
      mkdir -p "$ASDF_DIR"
    fi
    log_info "Created directory: $ASDF_DIR"
  else
    log_info "Directory already exists: $ASDF_DIR"
  fi
}

extract_asdf() {
  log_info "Extracting asdf to $ASDF_DIR..."

  if [[ "$SYSTEM_WIDE" == true ]]; then
    sudo tar -xzf "${TEMP_DIR}/${ARCHIVE_NAME}" -C "$ASDF_DIR"
    sudo chown -R root:root "$ASDF_DIR"
    sudo chmod 755 "$ASDF_DIR/asdf"
  else
    tar -xzf "${TEMP_DIR}/${ARCHIVE_NAME}" -C "$ASDF_DIR"
    chmod 755 "$ASDF_DIR/asdf"
  fi

  log_info "Extraction complete"
}

verify_installation() {
  log_info "Verifying installation..."

  local installed_version
  installed_version=$("$ASDF_DIR/asdf" version 2>&1 | head -1 || echo "")

  if [[ "$installed_version" == *"$LATEST_VERSION"* ]]; then
    log_info "asdf v${LATEST_VERSION} installed successfully!"
    return 0
  else
    log_warn "Could not verify exact version match"
    return 1
  fi
}

print_completion_message() {
  log_info ""
  log_info "Installation complete!"
  log_info ""

  if [[ "$SYSTEM_WIDE" == true ]]; then
    log_info "Add this to your shell configuration file (~/.bashrc, ~/.bash_profile, or ~/.zshrc):"
    echo ""
    echo "  export PATH=/opt/asdf:\$PATH"
    echo ""
  else
    log_info "Add this to your shell configuration file (~/.bashrc, ~/.bash_profile, or ~/.zshrc):"
    echo ""
    echo "  . \$HOME/.asdf/asdf.sh"
    echo "  . \$HOME/.asdf/completions/asdf.bash  # or asdf.zsh for zsh"
    echo ""
  fi

  log_info "Then run: source ~/.bashrc (or appropriate shell config file)"
  log_info "Verify installation with: asdf version"
}

# ============================================================================
# Main Function
# ============================================================================

main() {
  parse_arguments "$@"
  check_prerequisites
  fetch_latest_version
  detect_architecture
  prepare_download
  download_asdf
  create_installation_directory
  extract_asdf
  verify_installation
  print_completion_message
}

# ============================================================================
# Script Entry Point
# ============================================================================

main "$@"
