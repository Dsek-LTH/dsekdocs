%% D-sek regulatory document class

%% Class identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsekparagraphed}[2022/10/06]

\RequirePackage{expl3}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dsekdoc}}

\ProcessOptions \relax

\LoadClass{dsekdoc}

\ExplSyntaxOn

% This is the width for the § labels
\dim_new:N \g_dsek_para_label_dim
\dim_set:Nn \g_dsek_para_label_dim {40mm}

% This is the width for the § numbers
\dim_new:N \g_dsek_para_num_dim
\dim_set:Nn \g_dsek_para_num_dim {4em}

% This is the width of the separation between the § and the content
\dim_new:N \g_dsek_para_col_sep_dim
\dim_set:Nn \g_dsek_para_col_sep_dim {1em}

% This is the width of the § column in full.  It is calculated from the
% previous numbers.
\dim_new:N \g__dsek_para_col_dim
\dim_set:Nn \g__dsek_para_col_dim \g_dsek_para_label_dim
\dim_add:Nn \g__dsek_para_col_dim \g_dsek_para_num_dim

% Number of the § paragraph
\newcounter{DsekParagraph}

% Format for the § number
\tl_new:N \g_dsek_para_num_format_tl

\tl_const:Nn \c_dsek_para_top_level_format_tl
   {§ \arabic{DsekParagraph}}

\tl_const:Nn \c_dsek_para_section_format_tl
   {§ \arabic{section}
    . \arabic{DsekParagraph}}

\tl_const:Nn \c_dsek_para_subsection_format_tl
   {§ \arabic{section}
    . \arabic{subsection}
    . \arabic{DsekParagraph}}

\tl_const:Nn \c_dsek_para_subsubsection_format_tl
   {§ \arabic{section}
    . \arabic{subsection}
    . \arabic{subsubsection}
    . \arabic{DsekParagraph}}

\tl_gset_eq:NN \g_dsek_para_num_format_tl \c_dsek_para_top_level_format_tl

\NewDocumentEnvironment{parasection}{}{
  \setcounter{DsekParagraph}{0}

  \begin{description}[
      align=parleft,
      labelindent=0mm,
      labelsep=\g_dsek_para_col_sep_dim,
      leftmargin=\g__dsek_para_col_dim + \g_dsek_para_col_sep_dim,
      labelwidth=\g__dsek_para_col_dim,
      itemindent=0mm,
      font=\normalfont]
}{
  \end{description}
}

\bool_new:N \g__dsek_para_begun_bool % Whether the current parasection has begun

\cs_new:Nn \__dsek_para_begin_possible_section: {
  \bool_gset_false:N \g__dsek_para_begun_bool
}
\cs_new:Nn \__dsek_para_end_possible_section: {
  \bool_if:NT \g__dsek_para_begun_bool {
    \end{parasection}
  }
}

\hook_gput_code:nnn {begindocument/end} {parasection} { % Start of document
  \__dsek_para_begin_possible_section:
}

\hook_gput_code:nnn {enddocument} {parasection} { % End of document
  \__dsek_para_end_possible_section:
}

\cs_set_eq:NN \__dsek_oldsection:n \section % Sections
\RenewDocumentCommand \section { m } {
  \__dsek_para_end_possible_section:
  \__dsek_oldsection:n{#1}
  \tl_gset_eq:NN \g_dsek_para_num_format_tl \c_dsek_para_section_format_tl
  \__dsek_para_begin_possible_section:
}

\cs_set_eq:NN \__dsek_oldsubsection:n \subsection % Subsections
\RenewDocumentCommand \subsection { m } {
  \__dsek_para_end_possible_section:
  \__dsek_oldsubsection:n{#1}
  \tl_gset_eq:NN \g_dsek_para_num_format_tl \c_dsek_para_subsection_format_tl
  \__dsek_para_begin_possible_section:
}

\cs_set_eq:NN \__dsek_oldsubsubsection:n \subsubsection % Subsubsections
\NewDocumentCommand \subbsubsection { m } {
  \__dsek_para_end_possible_section:
  \__dsek_oldsubsubsection:n{#1}
  \tl_gset_eq:NN \g_dsek_para_num_format_tl \c_dsek_para_subsubsection_format_tl
  \__dsek_para_begin_possible_section:
}

% This command creates a § label from a given number and label
\cs_new_protected:Npn \__dsek_para_label:nn #1#2 {
  \makebox[\g_dsek_para_num_dim][l]{\hypertarget{par:#1}{#1}}
  \parbox[t]{\g_dsek_para_label_dim}{#2}
}

% Shadow the paragraph command so that it matches semantically for the user.
\RenewDocumentCommand \paragraph { o m } {
  %% If the parasection hasn't begun yet, do so.
  \bool_if:NF \g__dsek_para_begun_bool {
    \begin{parasection}
    \bool_gset_true:N \g__dsek_para_begun_bool
  }

  \IfValueTF{#1} {
    \item[\__dsek_para_label:nn{#1}{#2}]
  }{
    \stepcounter{DsekParagraph}
    \item[\__dsek_para_label:nn{\tl_use:N \g_dsek_para_num_format_tl}{#2}]
  }
}

%% Adjust format of sections
\titleformat{\section}{\tl_use:N \c_dsek_section_format_tl}
            {\thesection.}{0.5em}{\Large}
\titlespacing*{\section}{0mm}{0mm}{2.5mm}

\ExplSyntaxOff
