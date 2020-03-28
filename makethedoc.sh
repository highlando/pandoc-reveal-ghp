MDFILE=slides.md

pandoc $MDFILE -o index.html \
    --filter pandoc-citeproc -t revealjs --slide-level=2 -s \
    --mathjax='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' \
    -V revealjs-url=https://revealjs.com \
    -V theme=solarized -V hash=true \
    -V viewDistance=15 -V width=1280 -V height=960 -V margin=0.05

# ## base theme slides -- works well
pandoc $MDFILE --filter pandoc-citeproc -t beamer -o base-theme-slides.pdf -H def.tex

# ## just create the body of the slides
pandoc $MDFILE --slide-level 2 -t beamer -o slides-body.tex
# ## delete the bottom 3 lines (where there is the references)
sed -i '$d' slides-body.tex
sed -i '$d' slides-body.tex
sed -i '$d' slides-body.tex

pdflatex -interaction=nonstopmode mpi-style-skeleton.tex
pdflatex -interaction=nonstopmode mpi-style-skeleton.tex
bibtex mpi-style-skeleton.aux
pdflatex -interaction=nonstopmode mpi-style-skeleton.tex
latexmk -c
