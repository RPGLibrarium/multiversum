# Prerequisites
Install:
- pdflatex
- (optional) latexmk

# New Issue

```
git checkout -b ausgabe<newnumber> # where newnumber is the next issue
cp src/multiversum-xxx.tex src/multiversum-<newnumber padded to 3 digits>.tex
```

# Build
Run 2-3 times
```
pdflatex src/<name>.tex
```
to compile, where ```<name>``` is the issue. Run until all hyperrefs & page sizes are correct (basically, until nothing changes anymore).
The result will be in the ```build/``` folder.

Alternatively, that can be done by running this just once (be aware that latexmk might be depricated and could stop working at some point):
```
latexmk src/<name>.tex
```

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
