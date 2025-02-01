# Pseudocode
So baut man den Graphen auf:
- Nodes definieren ```<L, C, in/out>```
    - For each Clause
        - For each Literal in Clause
            add ```<L, C, in>```
            add ```<L, C, out>```
- Type-2 edges definieren (wechseln von Literal in Klausel)
    - jede out-node wird mit jeder in-node verbunden, die nicht das selbe literal hat
    Straight Forward:
    ```py
        for inNode in inNodes:
            for outNode in outNodes:
                if (inNode.clause == outNode.clause and inNode.literal != outNode.literal):
                    add link from inNode to outNode
    ```
    Performanter?:
    ```py
        sameClause = lambda node1, node2: node1.clause == node2.clause
        differentLiteral = lambda node1, node2: node1.literal != node2.literal
        for inNode in inNodes:
            partners = filter(lambda outNode: sameClause(inNode, outNode) and differentLiteral(inNode, outNode), outNodes)
            newEdges = list(map(lambda partner: edge(inNode, partner)))
            edges.add(newEdges)
    ```
- Type-1 edges definieren
    ```py
        for outNode in outNodes:
            for inNode in inNodes:
                if unifizierbar:
                    edges.add(edge(outNode, inNode))

    ```



    - für knoten1 in alleOutKnoten:
    -   für knoten2 in alleInKnoten\<knoten1.L, knoten1.C, in>:
    -       if unifizierbar:
    -           definiere edge von knoten1 zu knoten2