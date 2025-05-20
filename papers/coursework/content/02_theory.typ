#import "../config.typ": *

= Theory

== Propositional logic

=== Syntax of propositional logic
Propositional logic deals with atomic boolean variables (usually denoted with letters $A, B, C, ...$ or $p, q, r, ...$).

They can be negated ($not$) or combined with different junctors ($and$ denoting _and_, $or$ denoting _or_) to form complex formulae.\
The notion that $A$ _implies_ $B$ is defined as $not A or B$ and noted as $A->B$.\
Logical _equivalence_ is defined as $(A -> B) and (B -> A)$ and noted with $A <-> B$.\
The ranking of operators is $ not >> and >> or >> -> >> <->$; where necessary, braces have to be added.

#example[Propositional logic syntax

  Suppose a set of variables ${A, B, C, D}$. Then $A$, $B and D$ and $((not not B <-> D and C) or 0) -> C$ are valid propositional logic formulae, whilst $not$ and $B and or D$ are not.
]

=== Semantic of propositional logic
Boolean variables can take the values $0$, which is interpreted as _false_, and $1$, being interpreted as _true_.
The semantics of logical operators can be stated with a simple truth table @fol_introduction:

#figure(
  table(
    columns: 7,
    rows: 5,
    align: center,
    [$A$],[$B$],[$not A$],[$A and B$],[$A or B$],[$A -> B$],[$A <-> B$],
    [0],[0],[1],[0],[0],[1],[1],
    [0],[1],[1],[0],[1],[1],[0],
    [1],[0],[0],[0],[1],[0],[0],
    [1],[1],[0],[1],[1],[1],[1],
  ),
  caption: [Truth table for basic operators in propositional logic.]
)<truth-table>

An _interpretation_ $cal(I): {A, B, C, ...} -> {0, 1}$ is a function mapping a (finite) set of variables onto boolean values. An interpretation that makes a formula true is called a _model_ of that formula.
A formula is called _satisfiable_, if there exists a model for it, and a _tautology_ if all interpretations are models.
Likewise, a formula is called _falsifiable_, if there exists an interpretation that is not a model and _unsatisfiable_, if no interpretation is a model.

#example[Propositional logic semantic.

  Suppose - a set of variables ${A, B, C, D}$ and - an interpretation $cal(I) = {A |-> 1, B |-> 0, C |-> 0, D |-> 1}$.

  Then the formulae\
  #h(1em)$alpha = D or 1$, $beta = not A -> B$ and $gamma = not C and not D <-> not (C or D)$\
  evaluate to be true under $cal(I)$ whilst\
  #h(1em)$delta = 0$, $epsilon = C -> B$ and $zeta = B or C and (A<->D)$\
  evaluate to be false under $cal(I)$.

  Note that the formulae $alpha$, $beta$, $gamma$, $epsilon$ and $zeta$ are satisfiable, $alpha$ and $gamma$ even being tautologies.
  The formulae $beta$, $delta$, $epsilon$ and $zeta$ are falsifiable, $delta$ is unsatisfiable.
]

=== Resolution in propositional logic
One natural question to ask when dealing with formulae is whether one or more formulae _imply_ another formula. One method of solving this problem is with _binary resolution_, formulated by J. A. Robinson in 1965 @resolution_primary.


If a formula is a conjunction of disjunctions and negations appear only directly before variables it is in #acrf("CNF").
A formula $alpha = (A or not B) and ... and (not C or A)$ in #acrs("CNF") can also be written as a set of _clauses_ $M_alpha = {{A,not B}, ..., {not C, A}}$, where the elements of clauses are called _literals_. The empty clause is denoted by $square$.

Now suppose the formula @mathe_grundlagen_it_mengen_logik:

$ alpha = (p or q or not r) and (r or not s) \
M_alpha = {{p, q, not r}, {r, not s}}. $

Is $alpha$ satisfiable?
For $alpha$ to be satisfiable, there has to exist a model of $alpha$, and for an interpretation of $alpha$ to be a model, it has to make both clauses in $M_alpha$ true.
The first clause gets true if $p^cal(I)=1$ or $q^cal(I)=1$, the second is true if $s^cal(I)=0$.
$r$ has no effect on the truth-value of the formula, because it appears once positive and once negative; the value of one literal always "canceles out" the value of the other one.
Out of these observations, we construct a new clause ${p, q, not s}$ and add it to our set of clauses.
Satisfiability of our previous set $M_alpha$ is now equivalent to satisfiability of our newly constructed set $M_alpha ' = "Res"(M_alpha)$:

$ M_alpha eq.triple "Res"(M_alpha) = M_alpha ' = {{p, q, not r}, {r, not s}, {p, q, not s}}. $

If resolution can be applied again, one abbreviates $"Res"("Res"(M_alpha))$ with $"Res"^2 (M_alpha)$, $"Res"("Res"("Res"(M_alpha)))$ with $"Res"^3 (M_alpha)$ and so on.
$"Res"^* (M_alpha)$ denotes the "final" set of clauses for which no more resolution can be applied.
If it contains the empty clause, there are no models of $"Res"^* (M_alpha)$, and because $"Res"^* (M_alpha) eq.triple M_alpha$ there are also no models of $M_alpha$, which in turn means, that $M_alpha$ is shown to be unsatisfiable.

Generalising this concept, the central inferencing rule of resolution @mathe_grundlagen_it_mengen_logik can be stated as follows:

$
  prooftree(
    rule(
      p_1 or ... or p_m or q_1 or ... or q_m,
      p_1 or ... or p_m or r,
      q_1 or ... or q_m or not r,
    )
  )","\
  "or in clause notation:"\
  prooftree(
    rule(
      {p_1, ..., p_m, q_1, ..., q_m},
      {p_1, ..., p_m, r},
      {q_1, ..., q_m, not r},
    )
  )"."
$

So how can this be obtained to proof that a set of formulae implies another formula?
Suppose one wants to proof that $alpha$, $beta$ and $gamma$ imply $delta$ with:

- $alpha = not q or r$
- $beta = p or not r$
- $gamma = not q or not p$
- $delta = q$


$ (not q or r) and (p or not r) and (not q or not p) tack.r.double q $



A formula $alpha$ implies another formula $beta$, if all models of $alpha$ are also models of $beta$. In this case, one writes $alpha tack.r.double beta$.



















== #acrl("FOL")


_First-order-logic_ is an extension of propositional logic.


_Terms_ are the most fundamental building block of #acrs("FOL") formulas.
They correspond to elements of the corresponding domain $D$ and consist of variables,
functions and constants.\
We assume a set $V subset D$ of _variables_.
Variables are usually denoted with the letters $x, y, z, x_1, y_2, ...$,
or in #acrs("TPTP") syntax: $X 1, X 2, ...$.\
We also assume a set $F$ of _function symbols_. All functions have the form $f: D^n -> D$, with $n$ being the arity of $f$. Function symbols usually take the letters $f, g, h, ...$. A function symbol and its arity are denoted as $f|_n$.\
_Constants_ represent a special case of functions with arity 0 and take the letters $a, b, c, ...$.\

_Predicates_ are of the form $P: D^n -> {0,1}$. They map (tuples of) domain elements onto truth values. The concept of function-arity is extended to predicates accordingly. They are usually denoted by $P, Q, R, S, ...$\
An _atom_ consists of a predicate $P$ and the corresponding input terms.\
A _formula_ is either an atom or the combination of atoms with logical operators ($not, and, or, ->, <->$) or quantors ($forall, exists$).\
A _substitution_ is a mapping $sigma: V^n -> T^n$ with $n in NN$ and $T$ denoting the set of all syntactically correct terms in the problem context. It is extended from variables to terms, atoms, literals and clauses accordingly.

A _literal_ is either an atom or a negated atom and usually denoted by $l_1, l_2, ... l_n$.\
A _clause_ $C$ is a set of literals ${l_1, l_2, ...,l_n}$. The boolean value of a clause is the disjunction of its literals truth values.
All variables in those literals are implicitly universally quantified.
Clauses are denoted by $C, D, E,..., C 1, C 2, ...,C N$. The empty clause is denoted by $square$.

#example[
We use the problem "PUZ001-1" of the #acrf("TPTP")-dataset as an example:
 - Variables $V = {x,y}$
 - Functions $F = {}$
 - Constants ${a, b, c}$ (standing for "agatha", "butler" and "charles")
 - Predicates ${H, K, L, R}$ (standing for "hates", "killed", "lives", "richer")

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
In his algorithm, he starts with $M_0$ being a model of ${not C_(c o n j)}$ ($C_(c o n j)$ being the conjecture). Then, a premise $C_0$ avoiding $M_0$ is selected, and a new model $M_1 tack.r.double {not C_(c o n j), C_0}$ is constructed. This procedure is repeated until no model can be found. The set of premises ${C_0, C_1, ..., C_n}$ is now treated as a candidate for proving the theory. This idea was implemented in SPASS @spass_1 by Sutcliffe and Puzis. The algorithm is able to reuse interpretations in different proofs. It also does not become ineffective concerning memory when proofs take more time, a problem other provers suffer from. On the other hand, the number of computed interpretations can get really high, making it ineffective for problems with large numbers of premises.

//todo: at least one other method


== Clause selection with #acrs("APT")

// introductory sentence

=== Terminology
For describing #acr("APT"), the following terminology is introduced.
It is based on Plaisted's work on alternating paths @properties_extensions_apt.

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

In this coursework and the implementation, the _length_ of an alternating path is equal to the number of clauses (including the start) minus one.
Note that Plaisted omitted this subtraction of one in his work @properties_extensions_apt.
Differing from his definition seemed more intuitive, because then, the conjecture clauses have an alternating path distance of zero to themselves.
This length is roughly analogue to the concept of a norm in a vector space, leading to a metric-like definition for clauses in $S$:

#definition("Relevance distance")[\
The _relevance distance_ $d_S$ is defined
1. between clauses ${C_1, C_2} subset.eq S$ as the length of the shortest path between those. If there is no alternating path between $C_1$ and $C_2$, their distance to one another is $infinity$.
2. between a subset $T in S$ and any clause $C in S$ as the shortest path from a clause in $T$ to $C$: $ d_S (T,C) =  min{d_S (D,C): D in T} $
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

Plaisted solves both problems by defining an algorithm where all values of $m$ are tried in parallel, interleaving the computations. If one concludes unsatisfiability, $S$ is proven to be unsatisfiable. @properties_extensions_apt

For the implmenetation in PyRes, $m$ is going to be set manually by the user via command line (see also @tech-spec). If $R_(m,S) (S')$ is found to be satisfiable, but there were clauses missing during saturation due to clauses selection with #acrs("APT"), PyRes doesn't return with "Satisfiable", but with "GaveUp", to indicate this uncertainty.
