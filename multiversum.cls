\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{multiversum}[2020/04/17 RPG Librarium Multiversum article]


%%%
% Derive from class: Memoir
% http://texdoc.net/texmf-dist/doc/latex/memoir/memman.pdf
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt,oneside,twocolumn,article]{memoir}
%
%%%


%%%
% Memoir Class Page formatting
%
% Compute a suitable line width.
\setlxvchars \setxlvchars
% type block size:
\settypeblocksize{700pt}{1.6\lxvchars}{*}
% type block at the center of the page:
\setlrmargins{*}{*}{1}
\setulmargins{*}{*}{1}
% separator between two columns, no rule:
\setcolsepandrule{0.5cm}{0pt}
% header and footer height:
\setheadfoot{2\onelineskip}{2\onelineskip}
% note margin width and separator:
\setmarginnotes{17pt}{3.5cm}{\onelineskip}
% save changes and fix the layout:
\checkandfixthelayout
% empty page layout (no header, no footer)
\pagestyle{empty}
%
%%%


%%%
% Spacing
%
% Floatings
\setlength{\textfloatsep}{10pt}
% Lists, Enumerations, Itemize
% tight spacing
\tightlists
%
%%%


%%%
% Fonts and Typesetting

% Mathspec: used to change math font.
\RequirePackage{mathspec}

%IPA
\RequirePackage{tipa}
\renewcommand\textipa[1]{{\fontfamily{cmr}\tipaencoding #1}}

%
% We use the open Adobe Source font family
% https://github.com/adobe-fonts
%
% Roman (Serif) Font: Source Serif Pro Light/Semibold
\setprimaryfont[
UprightFont={* Light},
ItalicFont={* Light Italic},
BoldFont={* Semibold},
BoldItalicFont={* Semibold Italic},
Scale=MatchLowercase]{Source Serif Pro}
%
% Sans Font: Source Sans Pro Light/Semibold
\setallsansfonts[
UprightFont={* Light},
ItalicFont={* Light Italic},
BoldFont={* Semibold},
BoldItalicFont={* Semibold Italic},
Scale=MatchLowercase]{Source Sans Pro}
%
% Mono Font: Source Code Pro Light/Semibold (No Italics available)
\setallmonofonts[
UprightFont={* Light},
BoldFont={* Semibold},
Scale=MatchLowercase]
{Source Code Pro}
%
% Replace math greek fonts by Source Serif Pro (No Italics available -> Use fake italics)
\setmathfont(Greek)[
  UprightFont={* Light},
  ItalicFont={* Light Italic},
  BoldFont={* Semibold},
  BoldItalicFont={* Semibold Italic},
  Scale=MatchLowercase
]
{Source Serif Pro}
%
%%%


%%% Colors!
\PassOptionsToPackage{table}{xcolor}
\RequirePackage{xcolor}
%%%


%%%
% Divisions
% Section Style
\setbeforesecskip{-.5em}
\newcommand{\ruledsec}[1]{%
	\LARGE\scshape\centering #1 \rule{\linewidth}{0.4pt}\noindent}
\setsecheadstyle{\ruledsec}
\setaftersecskip{.5em}
% Subsection Style
\setsubsecheadstyle{\Large\normalfont\raggedright}
% Paragraph Style
\setparaheadstyle{\bfseries}
% Disable numbering
\setsecnumdepth{part}
% include subsections in PDF bookmarks
\setcounter{tocdepth}{2}
%
%%%


%%%
% Language
\PassOptionsToPackage{english,ngerman}{babel}
\RequirePackage{babel}
\PassOptionsToPackage{german=quotes}{csquotes}
\RequirePackage{csquotes}
%
%%%


%%%
% Figures
\RequirePackage{graphicx}
%
%%%


%%%
% Date Format:
\PassOptionsToPackage{ngerman}{datetime}
\RequirePackage[ngerman]{datetime}
\newdateformat{monthyear}{\monthname[\THEMONTH] \THEYEAR}
%
%%%


%%%
% Licensing
\PassOptionsToPackage{%
  type={CC},
	modifier={by-nc-sa},
	version={4.0}
}{doclicense}
\RequirePackage{doclicense}
\RequirePackage{rotating}
\RequirePackage{wrapfig,ragged2e}
%%%


%%%
% Cross-References, Links and PDF-Metadata
\RequirePackage{hyperref}
\urlstyle{sf}
%
%%%


%%%
% Variables

\newcommand\multiauthor[1]{\renewcommand\@multiauthor{#1}}
\newcommand\@multiauthor{\@latex@error{No \noexpand\multiauthor given}\@ehc}

\newcommand\multidate[1]{\renewcommand\@multidate{#1}}
\newcommand\@multidate{\@latex@error{No \noexpand\multidate given}\@ehc}

\newcommand\multiausgabe[1]{\renewcommand\@multiausgabe{#1}}
\newcommand\@multiausgabe{\@latex@error{No \noexpand\multiausgabe given}\@ehc}

\newcommand\multilosung[1]{\renewcommand\@multilosung{\expandafter\MakeUppercase\expandafter{#1}}}
\newcommand\@multilosung{\@latex@error{No \noexpand\multilosung given}\@ehc}

% Defaults to Uberschrift.svg
\newcommand\multilogo[1]{\renewcommand\@multilogo{header/#1}}
\newcommand\@multilogo{header/Ueberschrift}
%%%


%%%
% Macros
%

% Title
%
% Use this command to set a nice looking title.
% first argument: number, e.g. 15
% second argument: losung, e.g. Die Kuh lief um den Teich.
%
\newcommand{\makemultititle}{
\hypersetup{
  pdftitle    = {Multiversum Ausgabe Nr. \@multiausgabe},
  pdfsubject  = {RPG Librarium Aachen e.V.},
  pdfauthor   = {\@multiauthor},
  pdfcreator  = {XeLaTex},
  hidelinks,
}

\author{\@multiauthor}
\date{\@multidate}
\title{Multiversum Ausgabe Nr. \@multiausgabe}

\twocolumn[
  \vspace*{-5em}
  {Ausgabe Nr. \@multiausgabe} \hfill {\@multidate}\\
  {\includegraphics[width=\linewidth]{\@multilogo}}%
  {\centering
  \hrule\vspace{\onelineskip}
  \@multilosung
  \vspace{\onelineskip}\hrule
  \vspace{\onelineskip}
  }\vspace*{2em}
]
}
%


%
% Impressum
%
\newcommand{\impressumRaw}{%
    \begin{Spacing}{0.5}
    \tiny
    {\RaggedRight
    \begin{wrapfigure}{R}{.3cm}
    \vspace*{-.55cm}
    \hspace*{-.3cm}
    \begin{sideways}
    \doclicenseImage[imagewidth=1.5cm]
    \end{sideways}
    \end{wrapfigure}
    Disclaimer \& Impressum: Teile des Inhalts sind rein fiktional; Ähnlichkeiten mit realen Personen und Begebenheiten sind zufällig und nicht beabsichtigt.\\
    \smallskip
    V.i.S.d.P. Hanna Franzen, RPG Librarium Aachen e.V. (VR 5440) \\
    Kontakt: Postfach 101632, 52016 Aachen, \href{mailto:multiversum@rpg-librarium.de}{multiversum@rpg-librarium.de} \\
    \smallskip
    \doclicenseText
    \par}
    \end{Spacing}
}

\newcommand{\impressum}{%
  \begin{figure}[!b]
      \impressumRaw
  \end{figure}
}

% Title
% Use this command at the end of each file for nice looking dates. One item
% per date.
%
\newenvironment{termine}{%
  \vfill
  \begin{figure}[!b]
    \begin{framed}
      \textbf{Nächste Termine:} \par
      \begin{itemize}
}{%
      \end{itemize}
    \end{framed}
    \vspace*{-2.55em} % Removes unnecessary spacing after the framed environment.
    \vspace{0.6em} % Keeps space to text, if not at the bottom of the page.
  \end{figure}
}
%

% Author-Mark
\newcommand{\Verfasser}[2][]{%
\par{\raggedleft{}{\itshape \mbox{#2}%
\ifx\relax#1\relax%
\else%
~(\mbox{#1})%
\fi%
}\par}}

\newcommand{\verfasser}[2][]{%
\hfill{\itshape \mbox{#2}%
\ifx\relax#1\relax%
\else%
~(\mbox{#1})%
\fi%
}}
%

% Annonce-Mark
\newcommand{\zeichen}[1]{%
  \par{\raggedleft{}Zeichen: \MakeUppercase{#1}\par}%
}
%

\newcommand{\zeitung}[1]{%
  \par{\raggedleft{}\itshape{}#1\par}\noindent%
}%
%
%%%
