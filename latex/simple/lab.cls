\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{lab}[2017/03/23 Laboratory Report Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


\RequirePackage[table]{xcolor}
\RequirePackage{float}
\RequirePackage{mdframed}
\RequirePackage[unicode=true]{hyperref}
\RequirePackage{xparse}
\RequirePackage{fancyhdr}
\RequirePackage{extramarks}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{pgf,tikz}
\RequirePackage{mathrsfs}
\RequirePackage{mathtools}
\RequirePackage{subcaption}
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
\RequirePackage{empheq}
\RequirePackage{cancel}
\RequirePackage{tocloft}
\RequirePackage{enumitem}
\RequirePackage{physics}
\RequirePackage[siunitx,american,betterproportions,smartlabels]{circuitikz}
\RequirePackage{chemfig}
\RequirePackage{pgfplots}
\RequirePackage{esint}
\RequirePackage{pifont}
\RequirePackage{booktabs}
\RequirePackage{titlesec}
%\RequirePackage[style=chem-acs,citestyle=authoryear-comp]{biblatex} % Uncomment if you want bibliography
\RequirePackage{color}
\RequirePackage{listings}

%% the following commands are needed for some matlab2tikz features
\pgfplotsset{compat=newest}
\usetikzlibrary{plotmarks}
\usetikzlibrary{arrows.meta}
\usepgfplotslibrary{patchplots}

\usetikzlibrary{automata,positioning,arrows}

\allowdisplaybreaks%

\captionsetup{subrefformat=parens}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\@cftmaketoctitle}{}

\newcommand{\hl}[1]{%
  \colorbox{yellow!50}{$\displaystyle#1$}}

% Command "alignedbox{}{}" for a box within an align environment
% Source: http://www.latex-community.org/forum/viewtopic.php?f=46&t=8144
\newlength\dlf% Define a new measure, dlf
\newcommand\alignedbox[2]{
  % Argument #1 = before & if there were no box (lhs)
  % Argument #2 = after & if there were no box (rhs)
  &  % Alignment sign of the line
  {
    \settowidth\dlf{$\displaystyle #1$}
    % The width of \dlf is the width of the lhs, with a displaystyle font
    \addtolength\dlf{\fboxsep+\fboxrule}
    % Add to it the distance to the box, and the width of the line of the box
    \hspace{-\dlf}
    % Move everything dlf units to the left, so that & #1 #2 is aligned under #1 & #2
    \boxed{#1 #2}
    % Put a box around lhs and rhs
  }
}

% Setup SIUnitx
\sisetup{group-separator = {,}, group-digits=integer, range-units=single, range-phrase = {--}, per-mode=symbol,per-symbol=/}

\DeclareSIUnit\poise{P}
\DeclareSIUnit\molar{M}
\DeclareSIUnit\inch{in}
\DeclareSIUnit\feet{ft}
\DeclareSIUnit\erg{erg}
\DeclareSIUnit\amu{amu}
\DeclareSIUnit\molecules{molecules}
\DeclareSIUnit\basepair{bp}
\DeclareSIUnit\cell{cell}

%
% Basic Document Settings
%

\topmargin=-0.45in
\evensidemargin=0in
\oddsidemargin=0in
\textwidth=6.5in
\textheight=9.0in
\headsep=0.25in

\linespread{1.1}

\renewcommand\headrulewidth{0.4pt}
\renewcommand\footrulewidth{0.4pt}

\setlength\parindent{0pt}

\setcounter{secnumdepth}{0}

%\numberwithin{equation}{section}

%
% Lab Details
% - Title
% - Due date
% - Class
% - Author
%
\newcommand*{\labTitle}[1]{\def\@labTitle{#1}}

\newcommand*{\labDate}[1]{\def\@labDate{#1}}

\newcommand*{\labClass}[1]{\def\@labClass{#1}}

\newcommand*{\labAuthor}[1]{\def\@labAuthor{#1}}

\newcommand*{\labCollaborators}[1]{\def\@labCollaborators{#1}}

%
% Title Page
%

\def\@maketitle{%
  \ifdefined\@labTitle
  \def\@titleline{}
  \fi

  \ifdefined\@labClass
  \def\@titleline{}
  \fi

  \begin{center}%
    \ifdefined\@titleline
    {%
      \LARGE
      \textmd{\textbf{%
          \ifdefined\@labClass%
          \@labClass
          \ifdefined\@labTitle{:\ }\fi
          \fi%
          \ifdefined\@labTitle%
          \@labTitle%
          \fi
        }}%
    }%
    \par
    \fi

    \ifdefined\@labAuthor
    \ifdefined\@titleline
    \vskip 1em
    \fi
    {\Large \textbf{\@labAuthor}}
    \par
    \fi

    \ifdefined\@labCollaborators
    \textit{Collaborators: \@labCollaborators}
    \fi

    \ifdefined\@labDate
    \small{Due\ on\ \@labDate}
    \fi%

  \end{center}%
  \par%
  \vskip 0.5em%
}

\titlespacing*{\section}{0pt}{1em}{0.5em}
\titlespacing*{\subsection}{0pt}{0.5em}{0.25em}

%
% Various Helper Commands
\newcommand{\union}{\cup}
\renewcommand{\checkmark}{\textrm{\ding{51}}}
\newcommand{\xmark}{\textrm{\ding{55}}}
\newcommand{\conc}[1]{\ensuremath{\qty[\ce{#1}]}}

% Probability commands: Expectation, Variance, Covariance, Bias
\newcommand{\E}{\mathrm{E}}
\newcommand{\Var}{\mathrm{Var}}
\newcommand{\Cov}{\mathrm{Cov}}
\newcommand{\Bias}{\mathrm{Bias}}

\renewcommand{\real}{\mathbb{R}}
\newcommand{\integers}{\mathbb{Z}}

\DeclareMathOperator{\proj}{proj}
\DeclareMathOperator{\re}{Re}
\DeclareMathOperator{\im}{Im}
\DeclareMathOperator{\Lik}{Lik}
\DeclareMathOperator{\Prob}{P}
\DeclareMathOperator{\sgn}{sgn}
\let\sign\sgn\DeclareDocumentCommand\sgn{}{\trigbraces{\sign}}

\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\theenumii}{\roman{enumii}}

\newcommand{\ddd}[1]{\dd{#1}}

\pgfkeys{/pgf/images/include external/.code=\includegraphics{#1}}

\newcommand{\pledge}[1]{
  \noindent {\Large \textbf{\textit{This paper represents my own work in
        accordance with University regulations --}} /s/ #1}
}

\renewcommand{\i}{\textbf{\^{\i}}}
\renewcommand{\j}{\textbf{\^{\j}}}
\renewcommand{\k}{\vu*{k}}

\definecolor{mygreen}{RGB}{28,172,0} % color values Red, Green, Blue
\definecolor{mylilas}{RGB}{170,55,241}
\lstset{language=Matlab,%
  % basicstyle=\color{red},
  basicstyle=\ttfamily\small,%
  breaklines=true,%
  morekeywords={matlab2tikz},
  keywordstyle=\color{blue},%
  morekeywords=[2]{1}, keywordstyle=[2]{\color{black}},
  identifierstyle=\color{black},%
  stringstyle=\color{mylilas},
  commentstyle=\color{mygreen},%
  showstringspaces=false,%without this there will be a symbol in the places where there is a space
  numbers=left,%
  numberstyle={\ttfamily \color{gray}},% size of the numbers
  numbersep=9pt, % this defines how far the numbers are from the text
  emph=[1]{for,end,break},emphstyle=[1]\color{red}, %some words to emphasise
  % emph=[2]{word1,word2}, emphstyle=[2]{style},
}

\setlength{\parskip}{1em}

% Numbering
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}