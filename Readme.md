# Prerequisites
Install:
- xelatex
- latexmk
- Fonts from https://github.com/adobe-fonts, in particular ```source-serif-pro```, ```source-sans-pro``` and ```source-code-pro``` (in the "non-variable font" release). On a Linux system, you will likely want to use the OTF files. That's about 38 font variations, so using a font manager is advised.

# New Issue

```
git checkout -b ausgabe<newnumber> # where newnumber is the next issue
cp src/multiversum-xxx.tex src/multiversum-<newnumber padded to 3 digits>.tex
```

# Build
Run
```
latexmk src/<name>.tex
```
to compile, where ```<name>``` is the issue.
The result will be in the ```build/``` folder.

If you have an older version of latexmk (for example, if you are running version 4.41), you may need to run
```
latexmk -xelatex src/<name>.tex
```
instead.

# Cleanup
Run
```
latexmk -c
```
if you want to delete temporary files and
```
latexmk -C
```
to also delete the PDF.
