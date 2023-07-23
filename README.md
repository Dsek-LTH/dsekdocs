# dsekdocs

`dsekdocs` is a package for the typesetting of [the D-guild](https://dsek.se/)'s LaTeX documents. It is meant to replace the now 20 year old package [dsek-latex](https://github.com/Dsek-LTH/dsek-latex). `dsekdocs` consists of a regular LaTeX package, [`dsek.sty`](dsek.sty), and two document classes: [`dsekdoc.cls`](dsekdoc.cls) and [`dsekregdoc.cls`](dsekregdoc.cls).


## Dependencies

`dsek` depends on

-   xparse
-   graphicx
-   enumitem

`dsekdoc` depends on

-   dsek
-   fontspec†
-   polyglossia†
-   calc
-   geometry
-   titlesec
-   hyperref
-   lastpage

`dsekregdoc` depends on

-   dsekdoc

† - these packages are incompatible with `pdflatex`. This means that **`dsekdoc` and `dsekregdoc` do not work with `pdflatex`.** Use `xelatex` or `lualatex` instead!


## Building

`dsekdocs` uses [`l3build`](https://ctan.org/pkg/l3build) for building the package documentation and the ready to publish CTAN-package.

To build the package documentation, you can run

```shell
$ l3build docs
```

and to build the CTAN package, you can run

```shell
$ l3build ctan
```


## Development


### Semantic versioning

`dsekdocs` uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Read through it before determining what kind of version bump to create.


### LaTeX

Documentation for the development of LaTeX packages is kind of scarce; especially so since we are using the relatively modern Expl syntax introduced in LaTeX3. Regardless, some good resources are:

-   [The expl3 docuementation](http://mirrors.ctan.org/macros/latex/contrib/l3kernel/expl3.pdf) is a good base for understanding the syntax.
-   [The xparse docuementation](http://mirrors.ctan.org/macros/latex/contrib/l3packages/xparse.pdf) is good for understanding the `xparse` package, which is featured heavily for the introduction of user-facing commands and environments.
-   [The LaTeX3 interfaces](http://mirrors.ctan.org/macros/latex/contrib/l3kernel/interface3.pdf) is a reference for most things LaTeX3. It describes all the different datatypes and how to use them.
-   The LaTeX Companion is a reference for all kinds of LaTeX concepts, not just LaTeX3.
