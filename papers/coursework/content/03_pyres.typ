#import "../typst-dhbw-template/lib.typ": *
#import "@preview/cetz:0.3.4": canvas, draw
#import draw: line, content, rect, on-layer

= PyRes
PyRes is an open-source theorem prover for first-order logic.
Its name originates from
#text("Py", weight: "bold")thon, the programming language it is built with,
and the #text("Res", weight: "bold")olution calculus, which it implements for solving #acr("FOL") problems.

== Python

Python is an interpreted high-level programming language. It supports multiple programming paradigms like functional programming and object orientation.
Python was created by Guido van Rossum in the early 1990s @python_history.
Not only is Python easy to learn and read, it also has a lot of packages like Numpy for efficient numerical computations, Pandas for manipulating big datasets, Matplotlib for plotting or TensorFlow and PyTorch for machine learning.
This is why it is among the most used programming languages.

== PyRes and other theorem provers
A lot of modern theorem provers, i.e. E @e_1, Vampire @vampire_1 and SPASS @spass_1, are built with low-level languages like C and C++ (@e_gh @vampire_gh @spass_gh). They employ optimized data structures and complex algorithms to increase their performance.
Other provers like iprover @iprover_gh are implemented in lesser-known languages like OCaml.
While those languages ensure soundness and efficiency, both approaches make it hard for new developers to understand the codebase and functionality, hence hindering further developement. This also leaves the didactic potential of theorem provers unused.

PyRes, on the other hand, is explicitly built for readability.
Extensive documentation and the choice of an interpreted language enable a step-by-step understanding of the functionality.
Its architecture and calculus is similar to other theorem provers, making it a suitable entry for understanding a multitude of provers. @teaching_by_example

Whilst PyRes doesn't have as much extensions for optimization than other provers, this simplicity makes it a good candidate for implementing and evaluating new approaches (like alternating path theory in this case).

== Architecture

PyRes is built with a layered architecture. @teaching_by_example

The bottom layer is a lexical scanner. The classes `Ident` and `Token` allow storing different symbols of #acrs("TPTP") expressions as variables. The class `Lexer` converts strings into sequences of such tokens, allowing further inspection and processing.

The next layer consists of different classes representing #acrs("FOL") objects. Multiple functions implement basic terms with s-expression-like nested lists. The class `Formula` implements atoms as well as complex formulae through a tree-structure.
Terms are also used by the class `Literal` to form literals, which are aggregated to clauses in `Clause`. These themselves are aggregated as sets in `ClauseSet`.

Finally, the classes `SearchParams` and `ProofState` utilize the previously mentioned classes to implement the given-clause algorithm. Here, the `ProofState` class holds two `ClauseSet`s: One for the processed and one for the unprocessed clauses.

Apart from those, there are multiple modularized components: `signature` provides an explicit signature of the formulae, `unification`, `subsumption`, `substitution`, `derivations` and `resolution` implement the corresponding #acrs("FOL") algorithms. `heuristics` and `indexing` provide different algorithms for optimized clause-selection during resolution.

To ensure an easy learning curve, PyRes comes in three increasingly more complex versions:
1. *`pyres-simple`*, a minimal version for clausal logic.
2. *`pyres-cnf`*, adding heuristics, indexing and sub-sumption.
3. *`pyres-fof`*, full support for #acrs("FOL") with equality.

== Functionality

PyRes functions as a pipeline.
First, the problem is parsed and converted to the data types specified in the previous chapter.
If needed (and supported by the specified version), equality axioms are added.
Then, the problem is being clausified to #acr("CNF"), before the actual reasoning takes place.

At the heart of PyRes is the given-clause algorithm @teaching_by_example. Here, the clauses are divided into two sets, one for unprocessed and another for processed clauses. In the beginning, all clauses are unprocessed. The algorithm now iteratively selects one of the unprocessed clauses, the _given-clause_, and computes its factors as well as the resolvents between the given-clause and all processed clauses. These new clauses are now added to the set of unprocessed clauses, whilst the given-clause is moved from the unprocessed clauses to the processed clauses. The algorithm ends either if the given-clause is the empty clause (and therefore a contradiction has been found) or the set of unprocessed clauses is empty. @given-clause-simple shows the implementation of the given-clause-algorithm in `pyres-simple`.

If the algorithm found a contradiction, the proof is then extracted. At last, the results are printed.
@pyres-pipeline illustrates this pipeline as a flow-chart.

#figure(
    image("../assets/pyres_pipeline.drawio.png", width: 250pt),
    caption: [Simple pipeline of PyRes's functionality.]
) <pyres-pipeline>


#figure(
```py
def processClause(self):
    """
    Pick a clause from unprocessed and process it. If the empty
    clause is found, return it. Otherwise return None.
    """
    given_clause = self.unprocessed.extractFirst()
    given_clause = given_clause.freshVarCopy()
    print("%", given_clause)
    if given_clause.isEmpty():
        # We have found an explicit contradiction
        return given_clause

    new = []
    factors    = computeAllFactors(given_clause)
    new.extend(factors)
    resolvents = computeAllResolvents(given_clause, self.processed)
    new.extend(resolvents)

    self.processed.addClause(given_clause)

    for c in new:
        self.unprocessed.addClause(c)
    return None

def saturate(self):
    """
    Main proof procedure. If the clause set is found unsatisfiable,
    return the empty clause as a witness. Otherwise return None.
    """
    while self.unprocessed:
        res = self.processClause()
        if res != None:
            return res
    else:
        return None
```,
caption: [The central functions for the given-clause algorithm in pyres-simple]
) <given-clause-simple>