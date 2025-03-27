#import "../config.typ": *

= Specification
This chapter serves to specify the context and requirements for the implementation. First, we will establish a formal description of the algorithm, then we will frame the technical details the algorithm will be embedded into.

== Formal description
The algorithm can be defined as a function


$ R_(n,S)(S'): (S, S', n) |-> {c in S | d_S (S',c) <= n} $

with $S$ being a set of all given clauses, $S' subset.eq S$ being the set of clauses, from which the relevance distance is computed (usually containing one clause, the conjecture to prove), $n in NN$ denoting the maximum relevance distance.
// and $N$ denoting the final set of clauses, on which the saturation shall be performed (with $S' subset.eq N subset.eq S$).






== Technical description



#figure(
```py
if params.perform_rel_filter:
    neg_conjs = cnf.getNegatedConjectures()
    rel_graph = SetRelevanceGraph(cnf)
    rel_cnf = rel_graph.get_rel_neighbourhood(neg_conjs, params.relevance_distance)
```
)






