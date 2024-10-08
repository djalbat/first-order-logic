# First Order Logic

First order logic for [Occam](https://occam.science).

There are the four rules for introducing and eliminating universal and existential quantification:

\[
\frac
{
P\;\;
u\;\textsf{is}\;\textsf{undefined}\;\;
u\;\textsf{is}\;\textsf{free}\;\textsf{in}\;P\;\;
v\;\textsf{is}\;\textsf{undefined}\;\;
v\;\textsf{is}\;\textsf{omitted}\;\textsf{from}\;P\;\;
}
{
\forall v\;P[v\;\textsf{for}\;u]
}
\quad\small\text{[UniversalIntroduction,UniversalGeneralisation]}
\]

&nbsp;

\[
\frac
{
\forall v\;P[v\;\textsf{for}\;u]
\;\;
u\;\textsf{is}\;\textsf{undefined}\;\;
u\;\textsf{is}\;\textsf{free}\;\textsf{in}\;P\;\;
v\;\textsf{is}\;\textsf{undefined}\;\;
v\;\textsf{is}\;\textsf{omitted}\;\textsf{from}\;P\;\;
}
{
P
}
\quad\small\text{[UniversalElimination,UniversalInstantiation]}
\]

&nbsp;

\[
\frac
{
P[v\;\textsf{for}\;u]
\;\;
u\;\textsf{is}\;\textsf{undefined}\;\;
u\;\textsf{is}\;\textsf{free}\;\textsf{in}\;P\;\;
v\;\textsf{is}\;\textsf{defined}\;\;
}
{
\exists u\; P
}
\quad\small\text{[ExistentialIntroduction,ExistentialGeneralisation]}
\]

&nbsp;

\[
\frac
{
\exists u\; P
\;\;
u\;\textsf{is}\;\textsf{undefined}\;\;
u\;\textsf{is}\;\textsf{free}\;\textsf{in}\;P\;\;
v\;\textsf{is}\;\textsf{omitted}\;\textsf{from}\;Q\;\;
P[v\;\textsf{for}\;u] \Rightarrow{Q}
}
{
Q
}
\quad\small\text{[ExistentialElimination,ExistentialInstantiation]}
\]

Note that the rules for free variables and metavariables are certainly not adepquate.
The philosophy behind their inclusion is that they are marginally better than nothing.
To really assert that a variable or metavariable is free or bound in an arbitrary statement would require some kind of embedded query language that would allow the user to traverse the parse tree.
Precisely what that language would look like has yet to be decided but there seems no alternative.

## Contact

* https://djalbat.com
