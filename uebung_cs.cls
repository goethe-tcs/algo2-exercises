% $Id: uebung_cs.cls 507 2009-04-15 15:40:29Z beckmann $
% (C) Copyright 2007 Andreas Beckmann <beckmann@ae.cs.uni-frankfurt.de>
% Some Updates (2021) by Holger Dell <dell@cs..>, use at own risk.

% according to http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=445839
% it's incorrect to include text with \AtEndDocument, so as a workaround
% do this first to avoid interference with other packages
%\ifthenelse{\equal{\uebcs@lectureurl}{}}{}{%
%\AtEndDocument{\uebcs@uebungfooter}
%}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uebung_cs}[2021/04/12 v0]
\PassOptionsToClass{a4paper,fontsize=11pt,parskip=half}{scrartcl}
\LoadClass{scrartcl}
\RequirePackage{scrlayer-scrpage}
\RequirePackage[a4paper,left=1in,right=1in,bottom=1.5in,top=1in]{geometry}
\RequirePackage{ifthen}
\RequirePackage{iftex}

\RequirePackage{amsmath,amsfonts,amssymb,ragged2e}
\RequirePackage[english,ngerman]{babel}
\ifpdftex
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{mathpazo}% palatino fonts
\else
	\RequirePackage{fontspec}
	\setmainfont{TeX Gyre Pagella} %palatino clone
\fi
\usepackage[babel,german=quotes]{csquotes}
\RequirePackage{microtype}
\RequirePackage{epic,graphicx,xcolor}
\RequirePackage{comment}
\RequirePackage[colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{tcolorbox}
\RequirePackage{cleveref}

\RequirePackage{subcaption}

\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nosep,itemsep=2pt}
\setenumerate[1]{label={\alph*)}}
\setenumerate[2]{label={\arabic*)}}

\RequirePackage{tikz}
\RequirePackage{tikz-qtree}
\RequirePackage{listings}
\lstset{%
  showstringspaces=false,
  mathescape=true,
  inputencoding=utf8,
  numbers=left,
  numberstyle=\color{gray},
  xleftmargin=\parindent,
  basicstyle=\footnotesize\ttfamily,
  keywordstyle=\bfseries\color{green!40!black},
  commentstyle=\normalfont\itshape\color{black!60},
  identifierstyle=\color{blue},
  stringstyle=\color{black!90},
  tabsize=2%
}
\RequirePackage{algpseudocodex}

\usetikzlibrary{shapes,arrows,decorations,decorations.pathmorphing,decorations.pathreplacing,plotmarks}
\RequirePackage{wrapfig}
\tcbuselibrary{theorems}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{lastpage}
\cfoot{Seite \thepage\ von \pageref*{LastPage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Hinweis}[1]{
    \vspace{-4mm}
    \begin{center}
        \fbox{\parbox{0.98\textwidth}{#1}}
\end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\highlighta}[1]{\tcbhighmath[size=small, colback=red!5!white,
	colframe=red!50!gray]{#1}}
\newcommand{\highlightb}[1]{\tcbhighmath[size=small, colback=black!5!white,
	colframe=black!30!gray]{#1}}
\newcommand{\highlightc}[1]{\tcbhighmath[size=small, colback=blue!5!white,
	colframe=blue!30!gray]{#1}}
\newcommand{\highlightd}[1]{\tcbhighmath[size=small, colback=green!5!white,
	colframe=green!30!gray]{#1}}
\newcommand{\highlighte}[1]{\tcbhighmath[size=small, colback=orange!5!white,
	colframe=orange!80!gray]{#1}}
\newcommand{\highlightf}[1]{\tcbhighmath[size=small, colback=yellow!5!white,
	colframe=yellow!80!black]{#1}}


\newcommand{\highlightA}[2]{\tcbhighmath[size=small, colback=red!5!white,
	colframe=red!50!gray,fonttitle=\scriptsize,title=#1, center title]{#2}}
\newcommand{\highlightB}[2]{\tcbhighmath[size=small, colback=black!5!white,
	colframe=black!30!gray,fonttitle=\scriptsize,title=#1, center title]{#2}}
\newcommand{\highlightC}[2]{\tcbhighmath[size=small, colback=blue!5!white,
	colframe=blue!30!gray,fonttitle=\scriptsize,title=#1, center title]{#2}}
\newcommand{\highlightD}[2]{\tcbhighmath[size=small, colback=green!5!white,
	colframe=green!30!gray,fonttitle=\scriptsize,title=#1, center title]{#2}}
\newcommand{\highlightE}[2]{\tcbhighmath[size=small, colback=orange!5!white,
colframe=orange!80!gray,fonttitle=\scriptsize,title=#1, center title]{#2}}


\newcommand{\addImage}[3]{\begin{tikzpicture}[remember picture,overlay]
	\node[inner sep=0pt] at (#1) {\includegraphics[width=#2]{#3}};
	\end{tikzpicture}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\NP}[0]{$\mathcal{NP}$}
\newcommand{\NPv}[0]{$\mathcal{NP}$-vollst"andig}
\newcommand{\Problem}[1]{\textsc{#1}}
\newcommand{\pr}{\ensuremath{\mathbb P}}
\newcommand{\Oh}[0]{\ensuremath{\mathcal{O}}}

% Usage: \uebung{Nummer}{Ausgabedatum}{Abgabedatum}
\newcommand{\uebung}[3]{%
\ifthenelse{\equal{#1}{}}{%
\def\uebcs@useuebungnr{false}%
\newtheorem{aufgabe}{\uebcs@@exercise}
}{%
\setcounter{uebungnr}{#1}%
\def\uebcs@useuebungnr{true}%
\newtheorem{aufgabe}{\uebcs@@exercise}[uebungnr]
}
\def\uebcs@ausgabe{#2}%
\def\uebcs@abgabe{#3}%
}

\newcommand{\blattname}[1]{%
\def\uebcs@blattname{#1}%
}

\newcommand{\institute}[1]{%
\def\uebcs@institute{#1}%
}

\newcommand{\chair}[1]{%
\def\uebcs@chair{#1}%
}

\newcommand{\staff}[2]{%
\def\uebcs@staff{#1}%
\def\uebcs@staffemail{#2}%
}

\newcommand{\semester}[1]{%
\def\uebcs@semester{#1}%
}

\newcommand{\lecture}[2]{%
\def\uebcs@lecture{#1}%
\def\uebcs@lectureurl{#2}%
}

\newcommand{\giturl}[1]{%
\def\uebcs@giturl{#1}%
}

\newcommand{\myparagraph}[1]{{\bf #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{german}
{
\institute{Institut f"ur Informatik}

% i18n: deutsch
\def\uebcs@@assignment{\"Ubung}
\def\uebcs@@issued{Ausgabe}
\def\uebcs@@due{Abgabe}
\def\uebcs@@exercise{Aufgabe}
\def\uebcs@@hint{Hinweis}
\def\uebcs@@pto{Bitte wenden!}
\def\uebcs@@ressources{Die \"Ubungsbl\"atter und weitere Informationen zur Vorlesung finden Sie unter\\}
%\def\uebcs@@email{E-Mail}
\def\uebcs@@samplesolution{Lösungsvorschlag}
\def\uebcs@@solution{Lösungsvorschlag}
}

\DeclareOption{english}
{
\institute{Institute for Computer Science}

% i18n: english
\def\uebcs@@assignment{Assignment}
\def\uebcs@@issued{Issued}
\def\uebcs@@due{Due}
\def\uebcs@@exercise{Exercise}
\def\uebcs@@hint{Hint}
\def\uebcs@@pto{Please turn over!}
\def\uebcs@@ressources{The assignments and further information concerning the lecture can be found at\\}
%\def\uebcs@@email{E-mail}
\def\uebcs@@samplesolution{Sample Solution}
\def\uebcs@@solution{Solution}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% defaults
\newcounter{uebungnr}
%\uebung{}{heute}{gestern}
\institute{Institut f"ur Informatik}
\chair{Blue Screen Research Group}
\staff{M\$ William G. Eats}{only@sp.am}
\semester{Informatikjahr 2006}
\lecture{Dank Informatik}{http://www.informatikjahr.de/}
\blattname{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExecuteOptions{german}
\ProcessOptions

\newboolean{loesung}
\newcounter{aufgabennr}

%\renewcommand\ThisComment[1]{%
%    \immediate\write\CommentStream{\unexpanded{#1}}%
%}

\newcommand{\red}[1]{\textcolor{red}{#1}}

\newcommand{\ignore}[1]{}
\renewcommand{\labelenumi}{\alph{enumi})}

\usepackage[amsmath,thmmarks]{ntheorem}
\theoremseparator{.}
\theorempreskip{1.2em plus 0.8em}
\theorempostskip{1.2em plus 0.8em}
\theorembodyfont{\upshape}
\theoremprework{\begin{samepage}}
\theorempostwork{\end{samepage}}
%\newtheorem{aufgabe}{\uebcs@@exercise}


\newcommand{\hinweis}[1]{\par\emph{\uebcs@@hint}: {\small #1}}
\let\hint\hinweis
\def\by#1#2{\stackrel{\rm #1}{#2}}

\newcommand{\warmup}{einfach}
\newcommand{\hard}{schwer}
\newcommand{\veryhard}{sehr schwer}

%\renewcommand\ThisComment[1]{%
%	\immediate\write\CommentStream{\unexpanded{#1}}%
%}

% Usage: \begin{loesung} ... \end{loesung}

\specialcomment{loesung}
{\begingroup\small\par\textbf{\uebcs@@solution:}\par}
{\endgroup}

\newcommand{\loesungnotiz}[1]{\ifthenelse{\boolean{loesung}}{#1}{}}


\AtBeginDocument{%
\ifthenelse{\boolean{loesung}}%
{\renewcommand{\new}{}}%
{\excludecomment{loesung}}
}

\AtBeginDocument{%
	\ifthenelse{\boolean{loesung}}%
	{\renewcommand{\new}{}}%
	{}
}


\newcommand{\aeprintwatermark}{
	\ifthenelse{\boolean{loesung}}{%
		\begin{tikzpicture}[remember picture,overlay]
		\node[black!10, at=(current page.center), scale=3.5, rotate=55] {\Huge\bfseries\uebcs@@samplesolution};
		\end{tikzpicture}
	}{}
}

\iffalse
\AddToHook{shipout/background}{\put (1in,-1in){\aeprintwatermark}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\debugbox#1{%
\fboxrule1pt%
\fboxsep-1pt%
\fbox{#1}%
}
\def\debugbox#1{#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read git info if available
\IfFileExists{\jobname.gitinfo}{\input{\jobname.gitinfo}}{}
%

\def\uebcs@uebungheader{{
\ifthenelse{\boolean{loesung}}{
	\begin{center}\Huge\bfseries \uebcs@@samplesolution\end{center}
	\vskip-2ex
}{}%
%
\parbox[c]{0.81\textwidth}{
	\huge\uebcs@lecture\\[1mm]%
	\small\uebcs@semester%
	\ifthenelse{\equal{\uebcs@staff}{}}{}{\vskip5mm\large\uebcs@staff}%
}
\hfill
\parbox[c]{18mm}{
\hfill
\includegraphics[height=15mm]{logo-kompakt}%
}

%{\parbox[b]{100mm}{%
%\Large\bfseries\ifthenelse{\equal{\uebcs@blattname}{}}{%
%\uebcs@@assignment\ \arabic{uebungnr}%
%}{%
{\Large\bfseries\uebcs@blattname}%
\ifdef{\gitAbbrevHash}{\hfill\textit{\footnotesize Revision \texttt{%
\ifdef{\uebcs@giturl}{\href{\uebcs@giturl/\gitHash}{\gitAbbrevHash}}{\gitAbbrevHash}%
} (\gitAuthorDate)}}{}
%}
%}}
%\hfill
%{\parbox[b]{50mm}{%
%		\ifthenelse{\equal{\uebcs@ausgabe}{}}{}{\mbox{}\hfill \uebcs@@issued: %\uebcs@ausgabe}%
%		\ifthenelse{\equal{\uebcs@abgabe}{}}{}{\mbox{}\hfill \uebcs@@due: \uebcs@abgabe}%
%	}}

}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\uebcs@uebungfooter{{
		\parskip1ex
		\vspace{5mm}
		\vfill
		\hrule

		\uebcs@@ressources
		\url{\uebcs@lectureurl}
		%\uebcs@@email: \texttt{\uebcs@staffemail}
		\vspace{-2ex} % hmm, something puts an paragraph end or whatever below this
	}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{\uebcs@uebungheader}

\endinput
