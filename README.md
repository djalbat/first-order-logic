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
P\;\textsf{omits}\;v\;\;
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
P\;\textsf{omits}\;v\;\;
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
\exists v\; P[v\;\textsf{for}\;u]
}
\quad\small\text{[ExistentialIntroduction,ExistentialGeneralisation]}
\]
&nbsp;
\[
\frac
{
\exists v\; P[v\;\textsf{for}\;u]
\;\;
u\;\textsf{is}\;\textsf{undefined}\;\;
u\;\textsf{is}\;\textsf{free}\;\textsf{in}\;P\;\;
Q\;\textsf{omits}\;v\;\;
P[v\;\textsf{for}\;u] \Rightarrow{Q}
}
{
Q
}
\quad\small\text{[ExistentialElimination,ExistentialInstantiation]}
\]

## Contact

* https://djalbat.com
