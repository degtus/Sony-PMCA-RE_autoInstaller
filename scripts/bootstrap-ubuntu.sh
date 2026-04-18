#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="${ROOT_DIR}/.venv"

if ! command -v apt-get >/dev/null 2>&1; then
  echo "This bootstrap script targets Ubuntu/Debian systems with apt-get."
  exit 1
fi

echo "[1/3] Installing system packages..."
sudo apt-get update
sudo apt-get install -y python3 python3-venv python3-tk libusb-1.0-0

if [ ! -d "${VENV_DIR}" ]; then
  echo "[2/3] Creating virtual environment at ${VENV_DIR}..."
  python3 -m venv "${VENV_DIR}"
else
  echo "[2/3] Reusing existing virtual environment at ${VENV_DIR}..."
fi

echo "[3/3] Installing Python dependencies..."
"${VENV_DIR}/bin/pip" install --upgrade pip
"${VENV_DIR}/bin/pip" install -r "${ROOT_DIR}/requirements.txt"

cat <<'EOF'

Environment ready.

Typical commands:
  source .venv/bin/activate
  python pmca-console.py -h
  sudo .venv/bin/python pmca-console.py serviceshell

This script works on the current checkout only.
It does not clone or update the repository for you.
EOF
