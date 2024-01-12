\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dseknotice}[2023/12/10]
\RequirePackage{expl3}

\ExplSyntaxOn

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dsekdoc}}

\ProcessOptions \relax

\LoadClass{dsekdoc}
\RequirePackage{longtable}
\usepackage{longtable}

\setshorttitle{Kallelse}

% counter for agenda items
\newcounter{issuecounter}

% arguments used for custom table headers, fallback to default
\NewDocumentEnvironment{agenda} {o o o} {
  \setcounter{issuecounter}{0}
  \renewcommand{\arraystretch}{1.15}
  \begin{center}
    \addfontfeatures{Numbers={Monospaced,Lining}}
    \begin{longtable}[c]{lp{0.47\textwidth}l p{0.11\textwidth}}
      \textbf{Nr.} &
      \IfValueTF{#1}{\textbf{#1}}{\textbf{Ärende}} &
      \IfValueTF{#2}{\textbf{#2}}{\textbf{Åtgärd}} &
      \IfValueTF{#3}{\textbf{#3}}{\textbf{Bilaga}} \\
      \hline
      \endhead
} {
    \end{longtable}
  \end{center}
  %% FIXME: Reset to the actual old value, which may or may not have been 1.
  \renewcommand{\arraystretch}{1}
}

\NewDocumentCommand \issue { m o o } {
  \stepcounter{issuecounter}
  §\theissuecounter & #1 & \IfValueTF{#2}{#2}{} & \IfValueTF{#3}{#3}{} \\
}

\ExplSyntaxOff
