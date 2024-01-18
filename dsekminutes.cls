%%% Document class for meeting minutes for the D-guild

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsekminutes}[2022/10/06]

\RequirePackage{expl3}

\ExplSyntaxOn

%%% Package options

%% Different inflection of type of regulatory document
\str_const:Nn \c_dsek_minutes_board_type_str { board }
\str_const:Nn \c_dsek_minutes_guild_type_str { guild }
\str_const:Nn \c_dsek_minutes_study_council_type_str { study-council }

\str_new:N \g_dsek_minutes_type_str
% default to guild meeting
\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_guild_type_str

%% Declare options for inflection of type of regulatory document
\DeclareOption{board}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_board_type_str}
\DeclareOption{guild}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_guild_type_str}
\DeclareOption{study-council}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_study_council_type_str}

%% Alternative options for easier access
\DeclareOption{styrelsen}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_board_type_str}
\DeclareOption{styrelsemöte}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_board_type_str}
\DeclareOption{styr}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_board_type_str}

\DeclareOption{sektion}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_guild_type_str}
\DeclareOption{sektionen}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_guild_type_str}
\DeclareOption{sektionsmöte}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_guild_type_str}
\DeclareOption{sekt}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_guild_type_str}

\DeclareOption{srd}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_study_council_type_str}
\DeclareOption{srdmöte}
   {\str_set_eq:NN \g_dsek_minutes_type_str \c_dsek_minutes_study_council_type_str}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dsekparagraphed}}

\ProcessOptions \relax

\LoadClass{dsekparagraphed}

%%% Short title
\str_if_eq:NNT \g_dsek_minutes_type_str
    \c_dsek_minutes_guild_type_str
    {\setshorttitle{Sektionsmötesprotokoll}}

\str_if_eq:NNT { \g_dsek_minutes_type_str }
    { \c_dsek_minutes_board_type_str }
    {\setshorttitle{Styrelsmöteseprotokoll}}

\str_if_eq:NNT { \g_dsek_minutes_type_str }
    { \c_dsek_minutes_study_council_type_str }
    {\setshorttitle{SRD-mötesprotokoll}}

%%% Attendance

\NewDocumentEnvironment{attendance}{ } {
  \begin{tabular}{ll}
} {
  \end{tabular}
}

\NewDocumentCommand \person { m o } {
  #1 & \IfValueT{#2}{#2} \\
}

%%% Text snippets

%%%% Yrkade

\NewDocumentCommand \yrkade { } {
  \textbf{yrkade~}
}

%%%% Ändringsyrkade

\NewDocumentCommand \andringsyrkade { } {
  \textbf{ändringsyrkade~}
}

\NewDocumentCommand \ändringsyrkade { } {
  \andringsyrkade
}

%%%% Beslöt

\NewDocumentCommand \beslot { } {
  \textbf{beslöt~}
}

\NewDocumentCommand \beslöt { } {
  \beslot
}

\ExplSyntaxOff
