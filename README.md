ISC 2017 Guide
==============

This repository is broken up into 2 main directories. As the names suggest, the
latex directory contains files relating to LaTeX, while matlab contains files
relating to MATLAB.


MATLAB
------
The most important file to pay attention to in the [`matlab`](matlab) directory
is the file [`reference.mlx`](matlab/reference.mlx). This is an expanded guide
to MATLAB that covers topics more in-depth than we can cover in our
presentation. However, remember that MATLAB is well documented! We have covered
a select few subjects that we think are particularly useful. Think of this file
first as a reference for when you are a MATLAB beginner and later as a jumping
off point to guide your foray into the world of more advanced MATLAB
programming.

LaTeX
-----
First, the directory [`basic_example`](latex/basic_example/) contains a simple example of a latex file
and some of the basic commands and environment you will need to know to write
LaTeX documents. Opening the code, which is contained in the file 'example.tex',
next to the PDF is the most effective way to learn the basics. 
The LaTeX directory includes a [`lab.cls`](latex/lab.cls) file that you can use
to create lab reports in LaTeX more easily. It also includes an example lab
report that make use of it, in the [`complex`](latex/complex) subdirectory.
The compiled PDF outputs are also in that directory so you can see what the finished
result can look like.

In order to use [`lab.cls`](latex/lab.cls) it is not necessary to understand
how it works. An easy way to get started with it is to copy it it into the same
directory as your other LaTeX files and place this at the top of your LaTeX
file:
```latex
\documentclass{lab}
```
From there you probably want to make use of the `\labTitle`, `\labAuthor`,
`\labCollaborators` and `\labDate` commands and call `\maketitle` right after
your `\begin{document}` as shown in [the example](latex/complex/complex.tex).
For more information about how to use
[`lab.cls`](latex/lab.cls) and the features it provides, please see [the
examples](latex) or [contact Jake](mailto:waksbaum@princeton.edu).
