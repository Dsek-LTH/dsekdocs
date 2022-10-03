%%% D-sek doc documentclass

%%% Class identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsekdoc}[2022/06/12]

\ExplSyntaxOn

%%% Declaration of options
\bool_new:N \g_dsek_in_english_bool
\DeclareOption{english}{\bool_set_true:N \g_dsek_in_english_bool}

\PassOptionsToClass{a4paper}{article}
\PassOptionsToClass{11pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExplSyntaxOff

%% Execution of options
\ProcessOptions \relax

\LoadClass{article}

%% Require packages
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\RequirePackage[bw]{dsek}
\RequirePackage{calc}
\RequirePackage[
  textwidth  = 160mm,
  textheight = 230mm,
  top        = (1in - 15mm),
  includehead,
  headsep    = 20mm,
  headheight = 16mm
]{geometry}
\RequirePackage[pagestyles]{titlesec}
\RequirePackage{lastpage}

%% Font configuration
\setmainfont{Domitian-Roman.otf}[
  Numbers=OldStyle,
  BoldFont=Domitian-Bold.otf,
  ItalicFont=Domitian-Italic.otf,
  BoldItalicFont=Domitian-BoldItalic.otf]
\setsansfont{texgyreheros-regular.otf}[
  Scale=MatchLowercase,
  BoldFont=texgyreheros-bold.otf,
  ItalicFont=texgyreheros-italic.otf,
  BoldItalicFont=texgyreheros-bolditalic.otf]
\providefontfamily\tffamily{texgyrepagella-regular.otf}

\ExplSyntaxOn
%% Languages

\bool_if:NTF \g_dsek_in_english_bool {
  \setmainlanguage{english}
  \setotherlanguage{swedish}
} {
  \setmainlanguage{swedish}
  \setotherlanguage{english}
}

%% Section styling
\titleformat*{\section}{\Large\sffamily\bfseries}
\titleformat*{\subsection}{\large\sffamily\bfseries}
\titleformat*{\subsubsection}{\sffamily\bfseries}

%% Paragraph styling
\titleformat*{\paragraph}{\sffamily\bfseries}
\titleformat*{\subparagraph}{\sffamily\bfseries}
\setlength{\parindent}{0mm}
\setlength{\parskip}{3mm}

%% Headers and footers
\tl_new:N \g_dsek_short_title_tl
\titleformat*{\paragraph}{\sffamily\bfseries}
\titleformat*{\subparagraph}{\sffamily\bfseries}
\setlength{\parindent}{0mm}
\tl_new:N \g_dsek_meeting_tl

\NewDocumentCommand \setshorttitle { m }{
  \tl_set:Nx \g_dsek_short_title_tl { #1 }
}

\NewDocumentCommand \setmeeting { m }{
  \tl_set:Nn \g_dsek_meeting_tl { #1 }
}

\newpagestyle{main}{
  \sethead {
    \parbox{18mm}{\Dseksigil[height=16mm]}
    \parbox{80mm}{{\textsc{\Dseklongname}} \newline
      {\small\textsc{\tl_to_str:N \g_dsek_short_title_tl}}}
  }{}{
    \parbox{60mm}{\small
      \hbox{} \hfill{\tl_to_str:N \g_dsek_meeting_tl} \\
      \hbox{} \hfill{\makeatletter \@date \makeatother}}
  }
  \setheadrule{0pt}
  \setfootrule{.4pt}
  \setfoot{}{\tffamily\thepage\ (\pageref{LastPage})}{}
}
\pagestyle{main}
\ExplSyntaxOff

