MDFILE=slides.md
HTMLFILE=slides.html

pandoc $MDFILE -o ${HTMLFILE} \
    --filter pandoc-citeproc -t revealjs --slide-level=2 -s \
    --mathjax='node_modules/mathjax/es5/tex-mml-chtml.js' \
    -V revealjs-url=node_modules/reveal.js/js \
    -V theme=solarized -V hash=true \
    -V viewDistance=15 -V width=1280 -V height=960 -V margin=0.05

# ## base theme slides -- works well
# pandoc $MDFILE --filter pandoc-citeproc -t beamer -o base-theme-slides.pdf -H def.tex
