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
  {not L(x), R(x,a), H(b,x)}_10,
  {K(b,a), K(c,a)}_11}$
 #set align(left)
]

#pagebreak()
== Clause selection

Clause selection is the problem of identifying and selecting those clauses of a logical problem, that are necessary and sufficient for a full proof. On the one hand, failing to identify necessary clauses prevents a successfull proof, on the other hand, selecting irrelevant clauses can slow down the proof algorithm.

In general, one has to differentiate between two types of clause selection: clause selection _before_ saturation and clause selection _during_ saturation.
While the first one functions like a filter in the prover-pipeline, the second one serves as a heuristic for finding proofs faster.
In a worst case scenario, the first one can prevent a successful output by removing important clauses, whilst the second can only delay the consideration of a needed clause.
Oftentimes, the same principle idea can be applied to implement both kinds of selections.
This coursework focuses on the first kind of selection (for the full pipeline, see @pyres-apt-pipeline). For that, there are different approaches:

// Reiff and Schellhorn - coming from the perspective of software verification - propose an algorithm for removing certain axioms.
// For this reduction, they identify four criterions: the _minimality criterion_, the _structure criterion_, the _specification criterion_ and the _recursion criterion_.

Meng and Paulson @symbol_sharing_relevance introduced an approach based on the sharing of symbols. They essentially computed a score for each clause (i.e. the number of relevant symbols divided by the total number of symbols) and accepted all clauses, whose score exceeds some pass mark $0 < p < 1$.
All symbols of accepted clauses are then regarded as relevant and the procedure repeats iteratively. The passmark is increasing (and therefore getting stricter) every iteration with the formula $p_(i+1) = p_i + (1-p_i)/c$, c being a parameter for convergence. They found $p = 0.6$ and $c = 2.4$ to be effective.
Although the approach is farely simply, it increased the number of problems solved for a given time limit for E @e_1, SPASS @spass_1 and Vampire @vampire_1.

Pudlak @semantic_selection introduced an approach where relevance is computed using finite models.
In his algorithm, a model $M_0$ of ${not C_(c o n j)}$ ($C_(c o n j)$ being the conjecture). Now, a premise $C_0$ avoiding $M_0$ is selected, and a new model $M_1 tack.r.double {not C_(c o n j), C_0}$ is constructed. This procedure is repeated until no model can be found. The set of premises ${C_0, C_1, ..., C_n}$ is now treated as a candidate for proving the theory. This idea was implemented in SPASS @spass_1 by Sutcliffe and Puzis. The algorithm is able to reuse interpretations in different proofs. It also does not become ineffective concerning memory when proofs take more time, a problem other provers suffer from. On the other hand, the number of computed interpretations can get really high, making it ineffective for problems with large numbers of premises.

//todo: more other methods

== Clause selection with #acrs("APT")

// introductory sentence

=== Terminology
For describing #acr("APT"), the following terminology is introduced:

The relation $eq.triple$ denotes syntactic identity, meaning
$A eq.triple A$,
$not A eq.triple not A$,
$A eq.triple not not A$,
$not not A eq.triple A$ for all atoms A.

Two literals $L$ and $M$ are _complementary unifiable_ if there are substitutions $sigma$ and $tau$ so that $sigma(L) eq.triple not tau(M)$. This leads to the central definition of #acrs("APT"):

#definition("Alternating Path")[\
An _alternating path_ in a set of clauses $S$ from $C_1$ to $C_n$ is a sequence

$ C_1, p_1, C_2, p_2, ..., C_(n-1),p_(n-1),C_n $

with

- $C_i in S$ for all $i$,
- $p_i = (L_i, M_(i+1))$ being a tuple of literals with $L_i in C_i$ and $M_(i+1) in C_(i+1)$,
- $L_i$ and $M_(i+1)$ being complementary unifiable and
- $L_i eq.triple.not M_i$.
]

The name "alternating" comes from the notion, that the path alternates between connecting two clauses through the unifiability of its' literals and switching literals inside a clause. Oftentimes one omits the $p_i$ when denoting an alternating path.

The _length_ of an alternating path is equal to the number of clauses including the start. This length is analogue to the concept of a norm in a vector space, leading to a metric for clauses in $S$:

#definition("Relevance distance")[\
The _relevance distance_ $d_S$ is defined
1. between clauses ${C_1, C_2} subset.eq S$ as the length of the shortest path between those. If there is no alternating path between $C_1$ and $C_2$, their distance to one another is $infinity$.
2. between a subset $T in S$ and a clause $C in S$ as the shortest path from a clause in $T$ to $C$: $ d_S (T,C) =  min{d_S (D,C): D in T} $
]

If $d_S (C_1, C_2) != infinity$, $C_1$ and $C_2$ are _relevance connected_ in $S$. A set of clauses $S' subset.eq S$ is relevance connected, if every pair of two clauses in $S$ is relevance connected.

#definition("Relevance neighbourhood")[\
The _relevance neighbourhood_ from $T subset.eq S$ regarding the relevance distance $n$ is defined as
$ R_(n,S) (T) = {C in S: d_S (T,C) <= n} $
]

The last definition required for formulating the central theorem of clause-selection using #acrs("APT") is that of a _set of support_:
#definition("Set of Support")[\
  Let $S$ be a unsatisfiable set of clauses. $S' subset.eq S$ is called a set of support for $S$, if it shares at least one clause with every unsatisfiable subset of $S$.
]

=== Functionality
Using this terminology, Plaisted @properties_extensions_apt concludes the following theorem:

#theorem[\
  Let $S$ be an unsatisfiable set of clauses. If
  - $S' subset.eq S $ is a support set for $S$,
  - there is a length $n$ refutation from $S$ and
  - $m>=2n-2$,
  then $R_(m,S) (S')$ is unsatisfiable.
]

Flipping this on its head leads to the following theorem proving method:

#h(1em) For a given $m$, compute $R_(m,S) (S')$ and test $R_(m,S) (S')$ for satisfiability.

There are two practical problems to this approach: On the one hand, the computation of $R_(m,S) (S')$ isn't guaranteed to terminate; on the other hand, unsatisfiability of $R_(m,S) (S')$ proves unsatisfiability for $S$, but satisfiability for $R_(m,S) (S')$ does not prove satisfiability for $S$.

Plaisted solves both problems by defining an algorithm where all values of $m$ are tried in parallel, interleaving the computations. If one concludes, unsatisfiability, $S$ is proven to be unsatisfiable. @properties_extensions_apt

For the implmenetation in PyRes, $m$ is going to be set manually by the user via command line (see also @tech-spec). If $R_(m,S) (S')$ is found to be satisfiable, but there were clauses missing during saturation due to clauses selection with #acrs("APT"), PyRes doesn't return with "Satisfiable", but with "GaveUp", to indicate this uncertainty.
