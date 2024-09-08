#!/bin/bash

set -euxo pipefail

# Find chrome/chromium/chromium-browser executable
if command -v google-chrome; then
  CHROME=google-chrome
elif command -v chromium-browser; then
  CHROME=chromium-browser
elif command -v chromium; then
  CHROME=chromium
elif command -v chrome; then
  CHROME=chrome
else
  echo "No chrome executable found"
  exit 1
fi

# Check for pandoc
if ! command -v pandoc; then
  echo "Pandoc not found"
  exit 1
fi

# Check for gpp
if ! command -v gpp; then
  echo "GPP not found"
  exit 1
fi

# Create build directory
mkdir -p build

# Run resume through preprocessors
gpp -H -DPUBLIC -o build/pub.md resume.md
gpp -H -o build/priv.md resume.md

# Convert to HTML
pandoc -s build/pub.md -o build/resume-public.html --template=template.html
pandoc -s build/priv.md -o build/resume-pdf.html --template=template-pdf.html

# Make sure style is in place
ln -sf ../pdf.css build/pdf.css

# Use chrome to print to pdf
$CHROME --headless --disable-gpu --no-sandbox --print-to-pdf=build/resume-private.pdf --virtual-time-budget=10000 build/resume-pdf.html
