# Workflow

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
source makethedoc.sh
git add index.html
git commit -m 'updated the index.html'

git checkout gh-pages
git merge pandoc-outputs
```

# Pandoc and mathjax and reveal.js

One can install [*reveal.js*](https://github.com/hakimel/reveal.js) and
[*mathjax*](https://github.com/mathjax/MathJax-src) using `npm` like

```
npm install mathjax-full
npm install ${path-to-reveal.js-repo}
```

add the `node_modules/...` paths to the *pandoc* script and start a local http
server via

```
npx http-server
```

to watch the `index.html` at [http://127.0.0.1:8080](http://127.0.0.1:8080)

