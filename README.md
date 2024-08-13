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

The concepts of free and bound variables are also defined, up to a point.
They are defined recusively over the structure of statements in relation to the standard propoisitional logic connectives, including the material conditional.

However, there is no way to corredtly define either free or bound variables at a root level, so to speak.
For bound variables the rule is adequate:

```
Rule (BoundVariable)
  Premise
    u is free in P
  Conclusion
    u is bound in ∀u P
```

However, for free variables the rule is certainly not adepquate:

```
Rule (FreeVariable)
  Premise
    u is contained in P
  Conclusion
    u is free in P
```

The philosophy behind the inclusion of this rule is that it is marginally better than nothing, 
but clearly the variable `u` being simply contained in the statement `P` is not enough to guarantee that it is free.

To really assert that a variable is free or bound in an arbitrary statement would require some kind of embedded query language that would allow the user to traverse the parse tree.
Precisely what that language would look like has yet to be decided but there seems no alternative.

## Contact

* https://djalbat.com
