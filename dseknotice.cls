\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dseknotice}[2023/12/10]
\RequirePackage{expl3}

\ExplSyntaxOn

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dsekdoc}}

\ProcessOptions \relax

\LoadClass{dsekdoc}

\setshorttitle{Kallelse}

\ExplSyntaxOff
