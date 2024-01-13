\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsekmotion}[2023/10/14]
\RequirePackage{expl3}

\ExplSyntaxOn

%% Declaration of options, default to motion
\DeclareOption{motion}{\bool_set_true:N \g_dsek_motion_bool}
\DeclareOption{proposition}{\bool_set_false:N \g_dsek_motion_bool}
\bool_set_true:N \g_dsek_motion_bool

\ProcessOptions \relax

\LoadClass{dsekdoc}

%% If motion, set title to Motion, else set to Proposition
%% Also create create a section with the title
\bool_if:NTF \g_dsek_motion_bool {
  \setshorttitle{Motion}
  \RenewDocumentCommand \settitle { m } {
    \tl_gset:Nn \g_dsek_title_tl {Motion:~#1 }
  }
}{
  \setshorttitle{Proposition}
  \RenewDocumentCommand \settitle { m } {
    \tl_gset:Nn \g_dsek_title_tl {Proposition:~#1 }
  }
}

\ExplSyntaxOff
