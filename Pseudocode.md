# Pseudocode

## Eigener Try
```py
def relevanceNeighbourhoodSet(bigS: ClauseSet, smallS: ClauseSet, distance: int):
    output = {}
    for clause in smallS:
        output = output.union(relevanceNeighbourhoodClause(bigS, clause, distance))
    return output

def relevanceNeighbourhoodClause(bigS: ClauseSet, fromClause: Clause, distance: int) -> ClauseSet:
    output = {}
    for toClause in bigS:
        relDistance = relevanceDistance(fromClause, toClause)
        if relDistance <= distance:
            output.add(toClause)
    return output

def relevanceDistance(clause1: Clause, clause2: Clause, bigS: ClauseSet) -> int:
    distance = Infinity
    paths = computeAlternatingPaths(clause1, clause2, bigS)
    
def computeAlternatingPaths(clause1: Clause, clause2: Clause, bigS: ClauseSet):


```
## Paper
```py
def relevanceNeighbourhoodSet(bigS: ClauseSet, smallS: ClauseSet, distance: int):
    graph = computeGraph(bigS)
    

def computeGraph(bigS: ClauseSet):

```

- graphen aufbauen
- breadth-first search mit distance 2(n-1)
- 



So baut man den Graphen auf:
- Nodes definieren ```<L, C, in/out>```
- Type-2 edges definieren (wechseln von Literal in Klausel)
    - jede out-node wird mit jeder in-node verbunden, die nicht das selbe literal hat
- Type-1 edges definieren
    - für knoten1 in alleOutKnoten:
    -   für knoten2 in alleInKnoten\<knoten1.L, knoten1.C, in>:
    -       if unifizierbar:
    -           definiere edge von knoten1 zu knoten2