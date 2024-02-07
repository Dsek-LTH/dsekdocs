\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{dsekrequirementsprofile}

\RequirePackage{expl3}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dsekdoc}}

\ProcessOptions \relax

\LoadClass{dsekdoc}

\ExplSyntaxOn

\setshorttitle{Kravprofil}

\NewDocumentCommand \kravprofilför { m } {
  \settitle{Kravprofil~för~#1}
}
