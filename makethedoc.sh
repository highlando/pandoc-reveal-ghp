MDFILE=slides.md
HTMLFILE=index.html

pandoc $MDFILE -o ${HTMLFILE} \
    --filter pandoc-citeproc -t revealjs --slide-level=2 -s \
    --mathjax \
    -V theme=solarized -V hash=true \
    -V viewDistance=15 -V width=1280 -V height=960 -V margin=0.05
    # -V revealjs-url=node_modules/reveal.js \
    # --mathjax='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' \

# pandoc $MDFILE --filter pandoc-citeproc -t beamer -o base-theme-slides.pdf -H def.tex
pandoc $MDFILE --slide-level 2 -t beamer --filter pandoc-citeproc -o slides-body.tex
