# dsekdocs

`dsekdocs` is a package for the typesetting of [the D-guild](https://dsek.se/)'s LaTeX documents. It is meant to replace the now 20 year old package [dsek-latex](https://github.com/Dsek-LTH/dsek-latex). `dsekdocs` consists of a regular LaTeX package, [`dsek.sty`](dsek.sty), and a number of document classes shown below in a hierarchy of dependencies:

- [`dsekdoc.cls`](dsekdoc.cls) is the root document class.
  - [`dsekmotion.cls`](dsekmotion.cls). Used for motions and propositions. (Motioner och propositioner)
  - [`dseknotice.cls`](dseknotice.cls). Used for notices. (Kallelser)
  - [`dsekelectionproposal.cls`](dsekelectionproposal.cls). Used for election proposals. (Valberedningens förslag)
  - [`dsekparagraphed.cls`](dsekparagraphed.cls). Used for documents with enumerated paragraphs.
    - [`dsekregdoc.cls`](dsekregdoc.cls). Used for regulatory documents. (Styrdokument)
      - [`dsekstatutes.cls`](dsekstatutes.cls). Used for statutes. (Stadgar)
      - [`dsekregulations.cls`](dsekregulations.cls). Used for regulations. (Reglemente)
      - [`dsekpolicy.cls`](dsekpolicy.cls). Used for policies. (Policyer)
      - [`dsekguideline.cls`](dsekguideline.cls). Used for guidelines. (Riktlinjer)

## Dependencies

The package `dsek` depends on

- xparse
- graphicx
- enumitem

The document class `dsekdoc` depends on

- dsek
- fontspec†
- polyglossia†
- calc
- geometry
- titlesec
- hyperref
- lastpage

All document classes depend on `dsekdoc`, but some have additional dependencies:

`dseknotice` depends on

- longtable

`dsekelectionproposal` depends on

- multicol

† - these packages are incompatible with `pdflatex`. This means that **document classes with these dependencies cannot be compiled with `pdflatex`.** Use `xelatex` or `lualatex` instead!

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

### Contributing

If there are bugs, features missing or something else about the development you want to discuss, please create an issue. Pull requests are also welcome, but a corresponding issue is nice to have, should multiple pull requests for the same functionality arise.

### Semantic versioning

`dsekdocs` uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Read through it before determining what kind of version bump to create.

### Tests

`dsekdocs` makes use of the regression testing facilities of `l3build`. To run the tests, run

```shell
$ l3build check
```

If you change the code for any commands in the package, some tests will in all likelihood fail. As these tests only check for a change in the output, this doesn't mean that the new code is *wrong*, but check that it's the tests you expect that fail and no more. For more details, see the `l3build` documentation.

If you introduce *new* functionality, please also introduce new tests. When you have a `.lvt` file that contains tests for this functionality, the corresponding `.tlg` files can be created with

```shell
$ l3build save <name of test>
$ l3build save -e luatex <name of test>
```

### LaTeX

Documentation for the development of LaTeX packages is kind of scarce; especially so since we are using the relatively modern Expl syntax introduced in LaTeX3. Regardless, some good resources are:

- [The expl3 docuementation](http://mirrors.ctan.org/macros/latex/contrib/l3kernel/expl3.pdf) is a good base for understanding the syntax.
- [The xparse docuementation](http://mirrors.ctan.org/macros/latex/contrib/l3packages/xparse.pdf) is good for understanding the `xparse` package, which is featured heavily for the introduction of user-facing commands and environments.
- [The LaTeX3 interfaces](http://mirrors.ctan.org/macros/latex/contrib/l3kernel/interface3.pdf) is a reference for most things LaTeX3. It describes all the different datatypes and how to use them.
- The LaTeX Companion is a reference for all kinds of LaTeX concepts, not just LaTeX3.
