# Vad är dsekdocs?

dsekdocs är ett nytt paket för att typsätta D-sektionens LaTeX-dokument.  Det är menat att ersätta det (i skrivande stund) 20 år gammla paketet [dsek-latex](https://github.com/Dsek-LTH/dsek-latex).

# Varför ersätta `dsek-latex`?

Trots att det har tjänat oss väl så länge har det några större brister:

- `dsekcommon` är ett paket och inte en dokumentklass, trots att det är invasivt och ändrar flertalet grejer när man inkluderar det,
- avsaknad av en rimlig struktur med dokumentklasser,
- [referenser till](https://github.com/Dsek-LTH/dsek-latex/blob/master/dsekcommands.dtx#L570) [saker som inte](https://github.com/Dsek-LTH/dsek-latex/blob/master/dsekcommands.dtx#L607) [har varit relevanta på länge](https://github.com/Dsek-LTH/dsek-latex/blob/master/dsekcommands.dtx#L539),
- omfattande hänsynstaganden för kompabilitet med [TtH](http://hutchinson.belmont.ma.us/tth/), vilket inte heller har varit relevant på länge,
- beroende på [lth-symb](https://github.com/Dsek-LTH/dsek-latex#lth-symboler-how-to), vilket är svårt att hantera med vanliga verktyg.

Att åtgärda dessa kommer oavsett kräva förändringar som inte är bakåtkompatibla, så att välja att skapa ett nytt paket är inte ogrundat.

# Hur ska dsekdocs utvecklas?

## Test-first utveckling

I största möjliga mån ska utvecklingen ske enligt test-first metodiken.  Det som står lite i vägen för det här är att testen inte kan vara helt automatiserade, då fel kan uppstå som inte går att märka automatiskt.

## Semantisk versionshantering
Utvecklingen av paketet bör använda sig av [semantisk versionshantering](https://semver.org/lang/sv/#semantisk-versionshantering-200) för att göra det lätt att hantera versionerna ur ett användarperspektiv. Eftersom semantisk versionshantering kräver att ett publikt API deklareras så kommer API:t för det här projektet avse dess dokumentkommandon och dokumentklasser.

# Lite resurser för LaTeX-utveckling

- [LaTeX på Wikibooks](https://en.wikibooks.org/wiki/LaTeX) är en bra referens för det mesta.
- [The LaTeX Companion](https://ptgmedia.pearsoncmg.com/images/9780201362992/samplepages/0201362996.pdf) är en bra referens att ha. Registret i slutet av boken är väldigt användbart, speciellt om man lär sig vad färgerna betyder.
- [Minutes in less than hours](http://tutex.tug.org/pracjourn/2005-4/hefferon/hefferon.pdf) är ett exempel på hur ett LaTeX-paket snabbt kan tas fram.
- [The visual LaTeX FAQ](https://texdoc.org/serve/visualFAQ.pdf/0) är en PDF där man kan klicka på olika delar av dokumentet för att få reda på hur de är implementerade.

## LaTeX3-resurser
Paketet använder en del LaTeX3-kod för att ha mer lättläslig kod.
Tyvärr så är det rätt glest med dokumentation och vägledning för LaTeX3 i dagens läge, men här är några resurser som har varit användbara än så länge:

- [expl3-dokumentationen](http://mirrors.ctan.org/macros/latex/contrib/l3kernel/expl3.pdf) är en bra bas för att förstå den experimentella syntaxen "Expl3". 
- [xparse-dokumentationen](http://mirrors.ctan.org/macros/latex/contrib/xargs/xargs.pdf) är bra för att förstå paketet xparse som används för att skapa dokumentkommandon.
- [The LaTeX3 interfaces](http://mirrors.ctan.org/macros/latex/contrib/l3kernel/interface3.pdf)
är en referens för det mesta LaTeX3. Den beskriver de olika datatyperna och hur man använder dem.

## Paketering av LaTeX-kod
- [How to Package Your LaTeX Package](https://texdoc.org/serve/dtxtut.pdf/0)
- [The .dtx format](https://www.texdev.net/2009/10/05/the-dtx-format/) och [A model .dtx file](https://www.texdev.net/2009/10/06/a-model-dtx-file/)
