#import "../config.typ": *

= Implementation

== Set-based Approach

=== Data structures

With this set-based approach, the data structures have different layers:

The most basic data structures are the classes `Node` and `Edge`. Each node contains a clause, a literal of that clause and a direction, namely `"in"` or `"out"`. Clauses and literals are implemented with the already available corresponding classes; the direction is implemented as simple string.
Each edge contains two nodes.
For both classes, a string representation for printing and debugging has been implemented.

Nodes and edges are organized in different sets (hence _set-based_).
For algorithmic simplicity, nodes are seperated into two sets, one containing all with direction `"in"`, the other containing all with direction `"out"`. Edges are aggregated in one set.

=== Graph construction algorithm

Nodes are constructed by iterating over all clauses and every literal of those clauses and adding a node with each direction to the corresponding set. This algorithm is therefore $cal(O)(|S| dot |L|)$, with $L$ denoting the set of all literals in clauses in $S$.

Edges between nodes of the same clause are constructed by checking, for each combination of nodes, whether their clauses are equal _and_ their literals are unequal. This case corresponds to the switching of literals of the same clause in an alternating path; an edge is created.

Edges between nodes of different clauses correspond to the potential resolution between those. Therefore, for each combination of nodes, their literals have to be evaluated.
On the one hand, the literal's signs have to be different for resolution to apply. On the other hand, there has to exist a possible unifier for both literals' atoms, which is checked with the already available `mgu` function of `unification.py`.

//todo: muss bei dieser Laufzeitberechung nicht noch die Komplexität von der mgu Berechnung berücksichtig werden?
Both edges of same and different clauses take $cal(O)(|S| dot |L|)$ time to compute.

=== Neighbourhood computation algorithm



