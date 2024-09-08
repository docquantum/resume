#!/bin/sh

# Run resume through preprocessors
gpp -H -DPUBLIC -o build/pub.md resume.md &&
gpp -H -o build/priv.md resume.md &&

# Convert to HTML
pandoc -s build/pub.md -o build/resume-public.html --template=template.html &&
pandoc -s build/priv.md -o build/resume-pdf.html --template=template-pdf.html &&

# Use chrome to print to pdf
chromium --headless --disable-gpu --print-to-pdf=build/resume-private.pdf --virtual-time-budget=10000 build/resume-pdf.html

# Clean up build dir
rm build/pub.md build/priv.md build/resume-pdf.html
