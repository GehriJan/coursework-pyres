#import "../config.typ": *

= Theory

== #acrf("FOL")

=== Basic #acrs("FOL") terminology

_Terms_ are the most fundamental building block of #acrs("FOL") formulas.
They constitute to elements of the corresponding domain $D$ and consist of variables,
functions and constants.\
We assume a set $V subset D$ of _variables_.
Variables are usually denoted with the letters $x, y, z, x_1, y_2, ...$,
or in #acrs("TPTP") syntax: $X 1, X 2, ...$.\
We also assume a set $F$ of _function symbols_. All functions have the form $f: D^n -> D$, with $n$ being the arity of $f$. Function symbols usually take the letters $f, g, h, ...$. A function and its arity are denoted as $f|_n$.\
_Constants_ represent a special case of functions with arity 0 and take the letters $a, b, c, ...$.\

_Predicates_ are of the form $P: D^n -> {0,1}$. They map (tuples of) domain elements onto truth values. The concept of function-arity is extended to predicates accordingly. They are usually denoted by $P, Q, R, S, ...$\
An _atom_ consists of a predicate $P$ and the corresponding input terms.\
A _formula_ is either an atom or the combination of atoms with logical operators ($not, and, or, ->, <->$) or quantors ($forall, exists$).\
A _substitution_ is a mapping $sigma: V^n -> T^n$ with $n in NN$ and $T$ denoting the set of all syntactically correct terms in the problem context. It is extended from variables to terms, atoms, literals and clauses accordingly.

A _literal_ is either an atom or a negated atom and usually denoted by $l_1, l_2, ... l_n$.\
A _clause_ $C$ is a set of literals ${l_1, l_2, ...,l_n}$. The boolean value of a clause is the disjunction of its literals truth values. Clauses are denoted by $C, D, E,..., C 1, C 2, ...,C N$. The empty clause is denoted by $square$.\

#example[
We use the problem "PUZ001-1" of the #acrf("TPTP")-dataset as an example:
 - Variables $V = {x,y}$
 - Functions $F = {}$
 - Constants ${a, b, c}$ (standing for "agatha", "butler" and "charles")
 - Predicates ${H, K, L, R}$ (standing for "hates", "killed", "loves", "richer")

 - The set of clauses (with indexes for references):
 #set align(center)
 ${{L(a)}_1, {L(b)}_2,
  {not K(x,y), not R(x,y)}_3,
  {not H(a,x), not H(c,x)}_4,\
  {not H(x,a), not H(x,b), not H(x,c)}_5,
  {H(a,a)}_6,
  {H(a,c)}_7,
  {not K(x,y), H(x,y)}_8,\
  {not H(a,x), H(b,x)}_9,
  {not L(x), R(x,a), H(b,X)}_10,
  {K(b,a), K(c,a)}_11}$
 #set align(left)
]
