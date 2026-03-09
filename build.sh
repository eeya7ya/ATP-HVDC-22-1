#!/bin/bash
# Build script for main.tex
# Runs pdflatex -> bibtex -> pdflatex -> pdflatex to resolve all references

set -e

TEXFILE="main"
PDFLATEX="pdflatex"

echo "=== Pass 1: Initial compilation ==="
$PDFLATEX -interaction=nonstopmode -file-line-error "${TEXFILE}.tex"

echo "=== Running BibTeX ==="
bibtex "${TEXFILE}" || true

echo "=== Pass 2: Resolve references ==="
$PDFLATEX -interaction=nonstopmode -file-line-error "${TEXFILE}.tex"

echo "=== Pass 3: Final compilation ==="
$PDFLATEX -interaction=nonstopmode -file-line-error "${TEXFILE}.tex"

echo ""
echo "=== Build complete: ${TEXFILE}.pdf ==="
