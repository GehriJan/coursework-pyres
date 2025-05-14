#import "../config.typ": *

= Implementation

== Universal Set Approach

=== Data structures

With this approach, the data structures have different layers:

The most basic data structures are the classes `Node` and `Edge`.
Each node contains a clause and one literal of that clause, clauses and literals are implemented with the already available, corresponding classes.
The distinction between nodes by which the clause is entered end exited is made implicitly by aggregating them in sets (more on that later).
An edge simply consists of two nodes.

For both classes, a string representation for printing and debugging has been implemented.

#figure(
```py
class Node:
    def __init__(self, literal: Literal, clause: Clause) -> None:
        self.literal: Literal = literal
        self.clause: Clause = clause

    def __repr__(self) -> str:
        return f"<{self.clause.name},{self.literal}>"


class Edge:
    def __init__(self, node1: Node, node2: Node) -> None:
        self.node1: Node = node1
        self.node2: Node = node2

    def __repr__(self) -> str:
        return f"Edge: {self.node1} - {self.node2}"
```,
  caption: [Implementation of nodes and edges in the universal set approach.]
)

The next layer aggregates those classes into multiple sets:
For algorithmic simplicity, two sets of nodes are created: one refers to all nodes by which a clause is entered (`in_nodes`), the other refers to all nodes by which a clause is exited (`out_nodes`).
Edges are aggregated in a single set (hence _universal_ set approach).

=== Graph construction algorithm

Nodes are constructed by iterating over all clauses and every literal of those clauses and creating one node for `in_nodes` and one for `out_nodes`.
This algorithm is therefore $cal(O)(|S| dot |L|)$, with $L$ denoting the set of all literals in clauses in $S$.

Edges between nodes of the same clause are constructed by checking, for each combination of an `in_node` with an `out_node`, whether their clauses are equal _and_ their literals are unequal. This case corresponds to the switching of literals of the same clause in an alternating path; an edge is created.

Edges between nodes of different clauses correspond to the potential resolution between those. Therefore, for each combination of an `in_node` with an `out_node`, their literals have to be evaluated.
For the resolution calculus to apply, the literal's signs have to be different. Also, there has to exist a possible unifier for both literals' atoms, which is checked with the already available `mgu` function of `unification.py`.

//todo: muss bei dieser Laufzeitberechung nicht noch die Komplexität von der mgu Berechnung berücksichtig werden?
Both edges of same and different clauses take $cal(O)(|S| dot |L|)$ time to compute.

=== Neighbourhood computation algorithm

The relevance neighbourhood is computed as follows:

First, the set of conjectures is mapped to the corresponding set of nodes.





#figure(
```py
def get_rel_neighbourhood(self, from_clauses: ClauseSet, distance: int):

    neighbourhood = self.clauses_to_nodes(from_clauses)
    for _ in range(2 * distance - 1):
        new_neighbours = self.get_neighbours(neighbourhood)
        neighbourhood |= new_neighbours

    clauses = self.nodes_to_clauses(neighbourhood)
    return clauses

def get_neighbours(self, subset: set[Node]):
    neighbouring_edges = {
        edge for edge in self.edges
        if self.edge_neighb_of_subset(edge, subset)
    }
    self.edges -= neighbouring_edges
    neighbouring_nodes = {
        edge.node2 if edge.node1 in subset else edge.node1
        for edge in neighbouring_edges
    }
    return neighbouring_nodes

@staticmethod
def edge_neighb_of_subset(edge: Edge, subset: set[Node]):
    return (edge.node1 in subset) != (edge.node2 in subset)
```,
  caption: []
)


== Adjacency Set Approach