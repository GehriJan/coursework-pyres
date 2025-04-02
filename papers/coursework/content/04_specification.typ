#import "../config.typ": *

= Specification
This chapter serves to specify the context and requirements for the implementation. First, we will establish a formal description of the algorithm, then we will frame the technical details the algorithm will be embedded into.

== Formal specification
The algorithm can be stated as a function

$ R_(n,S)(S'): (S, S', n) |-> {c in S | d_S (S',c) <= n} $

with $S$ being a set of all given clauses, $S' subset.eq S$ being the set of clauses, from which the relevance distance is computed (usually containing one clause, the conjecture to prove), $n in NN$ denoting the maximum relevance distance and $d_S (S', c)$ being the minimal distance of $S'$ to the clause $c$.

#pagebreak()
== Technical specification
<tech-spec>

The implementation of #acr("APT") functions as a filter preceding the actual solving algorithm. Therefore, the only changes made to existing PyRes steps are the command line specification and the output of the result.

Whilst the parameters $S$ and $S'$ are defined by the problem file, the relevance distance $n$ can be specified with the command line argument `--relevance-distance/-r`.
If a relevance distance is specified, clause selection with #acr("APT") is performed before saturation. @pyres-apt-pipeline illustrates the new pipeline:

#figure(
    image("../assets/pyres_apt_pipeline.drawio.png"),
    caption: [PyRes pipeline with optional clause-selection step.\
    Orange denotes changed, red new steps.]
) <pyres-apt-pipeline>

Independently of implementation, the process of selecting relevant clauses features two steps: Firstly, the graph has to be constructed; secondly, the relevance neighbourhood of the negated conjectures has to be selected.
Each step is performed by a seperate python function.

To provide a unified interface for different implementations of #acr("APT"), both steps are aggregated in an abstract base class named `RelevanceGraph`. Each concrete implementation is created as a child class of `RelevanceGraph`, supplying a function body for both `construct_graph` and `get_rel_neighbourhood`.

@abc-relevance-graph contains the definition of the `RelevanceGraph` abstract base class, @main-apt-steps contains the actual code for clause selection in the PyRes main file.

#figure(
```py
from abc import ABC, abstractmethod
from clausesets import ClauseSet

class RelevanceGraph(ABC):

    def __init__(self, clause_set: ClauseSet):
        self.construct_graph(clause_set)

    @abstractmethod
    def construct_graph(self, clause_set: ClauseSet):
        pass

    @abstractmethod
    def get_rel_neighbourhood(self, from_clauses: ClauseSet, distance: int):
        pass
```,
caption: [Base Class for different implementations: `RelevanceGraph`]
) <abc-relevance-graph>

#figure(
```py
if params.perform_rel_filter:
    neg_conjs = cnf.getNegatedConjectures()
    rel_graph = SetRelevanceGraph(cnf)
    rel_cnf = rel_graph\
        .get_rel_neighbourhood(neg_conjs, params.relevance_distance)
```,
caption: [Main steps of performing clause selection, independent of implementation. `SetRelevanceGraph` is substituted with the implementations' class name.]
) <main-apt-steps>