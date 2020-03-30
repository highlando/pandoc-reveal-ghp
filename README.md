# Reveal.js and Custom Beamer Themes by Pandoc and Markdown

Using markdown, one can compile a slidedeck for a presentation in no time.

The finishing, say the adaption to a custom beamer theme or the inclusion of
reveal.js niceties, is better done by hand.

This repo provides example files and an example workflow how the core of the
slides are written in markdown and then merged into a branch that includes the
beamer styles or the reveal.js add ons.

The slides are live at
[http://janheiland.de/pandoc-reveal-ghp/](http://janheiland.de/pandoc-reveal-ghp/).
To control them remotely, open a [master
instance](http://janheiland.de/pandoc-reveal-ghp/?s=3b8b9997d1f16ed4) in a
different browser or device. This feature is provided by the *multiplex* module
of *reveal.js*. See the approach by
[seanho00](https://github.com/seanho00/reveal-multiplex) for a lightweight
realization.

# Workflow for markdown - pandoc - reveal.js 

1. on `master`, one changes the `md` source file.

2. on `pandoc-outputs` the outputs `index.html` and `slides-body.tex` that are
   produced with *pandoc* are put into the git index so that

3. they can be merged into `gh-pages`. On `gh-pages`, one may also change *html*
   attributes directly that go beyond what is possible with *markdown*.

```
git checkout master
git add slides.md
git commit -m 'updated the markdown source'

git checkout pandoc-outputs
git merge master
source makethedoc.sh
git add index.html
git commit -m 'updated the index.html'
LSTCHSH=$(git rev-parse HEAD)

git checkout gh-pages
git cherry-pick $LSTCHSH  # merge only the last commit
```

# Pandoc and (local) mathjax and reveal.js

One can install [*reveal.js*](https://github.com/hakimel/reveal.js) and
[*mathjax*](https://github.com/mathjax/MathJax-src) using `npm` like

```
npm install mathjax@3
npm install ${path-to-reveal.js-repo}
```

add the `node_modules/...` paths to the *pandoc* script like the `makethedoc.sh`
and start a local http server via

```
npx http-server
```

to watch the `index.html` at [http://127.0.0.1:8080](http://127.0.0.1:8080)

On the `master` branch the local versions are used. On the `gh-pages` we use
versions provided via *cdn*s.

# Workflow for Pandoc - texfile - custom beamer theme
```
git checkout master
git add slides.md
git commit -m 'updated the markdown source'

git checkout pandoc-outputs
git merge master
source makethedoc.sh
git add slides-body.tex
git commit -m 'updated the slides body'
LSTCHSH=$(git rev-parse HEAD)

git checkout mpi-style
git cherry-pick $LSTCHSH
```
