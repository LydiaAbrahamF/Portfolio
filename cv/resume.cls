% resume.cls - compatible re-implementation of the
% "Medium Length Professional CV" class (\name, \address, rSection, rSubsection)
\ProvidesClass{resume}[2026/11/18 Resume class]
\LoadClass[10pt,letterpaper]{article}

\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{enumitem}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{xcolor}

\pagestyle{empty}
\AtBeginDocument{\setlength{\parskip}{3pt plus 1pt}}

\def\@name{}
\def\@addresses{}
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\address}[1]{%
  \ifx\@addresses\@empty\def\@addresses{#1}%
  \else\g@addto@macro\@addresses{\\#1}\fi}

\newcommand{\printname}{%
  \begin{center}{\MakeUppercase{\fontsize{20pt}{24pt}\selectfont\bfseries\@name}}\end{center}\vspace{-6pt}}
\newcommand{\printaddress}{%
  \begin{center}{\small\@addresses}\end{center}\vspace{-2pt}}

\let\ori@document=\document
\renewcommand{\document}{\ori@document\printname\printaddress}

% Section: uppercase title with a rule underneath
\newenvironment{rSection}[1]{%
  \vspace{4pt}{\bfseries\MakeUppercase{#1}}\par\vspace{-8pt}
  \noindent\rule{\linewidth}{0.6pt}\par\vspace{-3pt}
  \begin{list}{}{\setlength{\leftmargin}{0em}\setlength{\itemsep}{1pt}\setlength{\topsep}{0pt}}
  \item[]
}{\end{list}\vspace{-2pt}}

% Subsection: {title}{dates}{organisation}{location}
\newenvironment{rSubsection}[4]{%
  {\bfseries #1}\hfill{#2}%
  \def\@tmp{#3#4}\ifx\@tmp\@empty\else\\{\itshape #3}\hfill{\itshape #4}\fi
  \vspace{-2pt}
  \begin{itemize}[leftmargin=1.2em,itemsep=0pt,topsep=1pt,parsep=0pt,label=\textbullet]
  \small
}{\end{itemize}\vspace{1pt}}
