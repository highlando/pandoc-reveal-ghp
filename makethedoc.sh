MDFILE=slides.md

pandoc $MDFILE -o index.html \
    --filter pandoc-citeproc -t revealjs --slide-level=2 -s \
    --mathjax='node_modules/mathjax/es5/tex-mml-chtml.js' \
    -V revealjs-url=https://revealjs.com \
    -V theme=solarized -V hash=true \
    -V viewDistance=15 -V width=1280 -V height=960 -V margin=0.05
    # -V revealjs-url=node_modules/reveal.js \
    # --mathjax='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' \

# ## base theme slides -- works well
# pandoc $MDFILE --filter pandoc-citeproc -t beamer -o base-theme-slides.pdf -H def.tex
# 

pandoc $MDFILE --slide-level 2 -t beamer -o slides-body.tex
