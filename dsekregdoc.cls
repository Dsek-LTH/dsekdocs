%% D-sek regulatory documentclass

%% Class identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsekregdoc}[2022/10/06]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dsekdoc}}

\ProcessOptions \relax

\LoadClass{dsekdoc}

\ExplSyntaxOn

\dim_new:N \g_dsek_regp_label_dim
\dim_set:Nn \g_dsek_regp_label_dim {40mm}

\dim_new:N \g_dsek_regp_num_dim
\dim_set:Nn \g_dsek_regp_num_dim {4em}

\dim_new:N \g_dsek_regp_col_sep_dim
\dim_set:Nn \g_dsek_regp_col_sep_dim {1em}

\dim_new:N \g__dsek_regp_col_dim
\dim_set:Nn \g__dsek_regp_col_dim \g_dsek_regp_label_dim
\dim_add:Nn \g__dsek_regp_col_dim \g_dsek_regp_num_dim

\NewDocumentEnvironment{regsection}{}{
  \begin{description}[
      align=parleft,
      labelindent=0mm,
      labelsep=\g_dsek_regp_col_sep_dim,
      leftmargin=\g__dsek_regp_col_dim + \g_dsek_regp_col_sep_dim,
      labelwidth=\g__dsek_regp_col_dim,
      itemindent=0mm,
      font=\normalfont]
}{
  \end{description}
}

\cs_new_protected:Npn \__dsek_regp_label:nn #1#2 {
  \makebox[\g_dsek_regp_num_dim][l]{§#1}
  \parbox[t]{\g_dsek_regp_label_dim}{#2}
}

\NewDocumentCommand \regitem { m m } {
  \item[\__dsek_regp_label:nn{#1}{#2}]
}

\titleformat{\section}{\sffamily\LARGE\bfseries}{\thesection.}{0.5em}{\LARGE}

\ExplSyntaxOff
