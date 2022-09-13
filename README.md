# Vad är dsekdocs?

dsekdocs är ett nytt paket för att typsätta D-sektionens LaTeX-dokument.  Det är menat att ersätta det (i skrivande stund) 20 år gammla paketet [dsek-latex](https://github.com/Dsek-LTH/dsek-latex).

# Varför ersätta `dsek-latex`?

Trots att det har tjänat oss väl så länge har det några större brister:

-   `dsekcommon` är ett paket och inte en dokumentklass, trots att det är invasivt
    och ändrar flertalet grejer när man inkluderar det,
-   avsaknad av en rimlig struktur med dokumentklasser,
-   [referenser till](https://github.com/Dsek-LTH/dsek-latex/blob/master/dsekcommands.dtx#L570) [saker som inte](https://github.com/Dsek-LTH/dsek-latex/blob/master/dsekcommands.dtx#L607) [har varit relevanta på länge](https://github.com/Dsek-LTH/dsek-latex/blob/master/dsekcommands.dtx#L539),
-   omfattande hänsynstaganden för kompabilitet med [TtH](http://hutchinson.belmont.ma.us/tth/), vilket inte heller har
    varit relevant på länge,
-   beroende på [lth-symb](https://github.com/Dsek-LTH/dsek-latex#lth-symboler-how-to), vilket är svårt att hantera med vanliga verktyg.

Att åtgärda dessa kommer oavsett kräva förändringar som inte är bakåtkompatibla, så att välja att skapa ett nytt paket är inte ogrundat.

# Hur ska dsekdocs utvecklas?

## Test-first utveckling

I största möjliga mån ska utvecklingen ske enligt test-first metodiken.  Det som står lite i vägen för det här är att testen inte kan vara helt automatiserade, då fel kan uppstå som inte går att märka automaiskt.

