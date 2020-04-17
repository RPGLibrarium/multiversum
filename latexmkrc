@default_excluded_files=('preamble.tex');
@default_files=('src/*.tex');
$clean_ext="xdv";
$pdf_mode=5;
$xelatex="xelatex -halt-on-error %O %S";
$out_dir='build';
