#!/bin/sh

gpp -H -DPUBLIC -o pub.md resume.md &&
gpp -H -o priv.md resume.md &&
pandoc -s pub.md -o resume-public.html --template=template.html &&
pandoc -s priv.md -o resume-pdf.html --template=template-pdf.html -c basicstyle.css &&
chromium --headless --disable-gpu --print-to-pdf=resume-private.pdf --virtual-time-budget=10000 resume-pdf.html
rm pub.md priv.md resume-pdf.html
