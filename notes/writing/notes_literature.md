# Literature Notes


## Properties and Extensions of Alternating Path Relevance I

Problem: With "dumb" Resolution algorithms, finding proofs for certain conclusions can be a resource and time intensive thing, especially for systems with lots of clauses.

## [Teaching ATP by Example: PyRes 1.2](../../../../papers/literature/978-3-030-51054-1.pdf)
- Introduction 
    - classification of pyres into scientific field; basic description
- Preliminaries
    - theoretical terms
    - further description of functionality
- System Design and Implementation
    - Architecture
        - layered SW-architecture
        - logical perspective: Pipeline
    - Implementation
        - Python
        - Class structure        
        - `ClauseSet`-Class
        - `pyres-cnf` and `pyres-fof`
    - Experiences
        - Tools (`unit-test` and `cProfile`)
- Experimental Evaluation
- Conclusion

## [A relevance restriction strategy for automated deduction](../../../../papers/literature/PY03.pdf) 
- Abstract
    - *Question:*
        Why is
        Unsatisfiable(R) <-> Unsatisfiable(S) and not
        Unsatisfiable(R) --> Unsatisfiable(S) (R\subset U)
1.  Introduction
    - Applications and problem leading to clause selection
    - relevance suggested for efficiency [6-8,14,18,20,23]
    - set-of-support
    - relevance set and function
    - goal-sensitive strategies are better than others [24]
    - charme of relevance techniques
2.  Definitions and background 
    - Notation: [5,12,17]
    - literal L := atom or negated atom
        - Atm(L) := atom of L
        - Atm(A) := set of atoms in A (A = {L1, L2, ..., LN})
    - clause C := disjunction of literals
    - theory S := set (conjuntion) of clauses

    - "L pure in S" := All L in S positive or All L in S negative
    - "ground term/formula" := no variables in term/formula
    - "Herbrand base of L_fancy" := set of ground atoms over L
    - interpretation I := set of L's where each element of Herbrand base of L_fancy appears once pos. xor neg. All elements of Herbrand base have value true
    - "I satisfies C" := intersection of set of literals of I and C non-empty. Otherwise C is falsified (violated) in I
    - "I is model M of S" := I satisfies all clauses of S.
      - "S satisfiable" := ∃ model of S
      - "S unsatisfiable" := not ∃ model of S
    - "M is minimal" := there is no proper subset of M, which is also a model of S

3. Relevance basics
    - 
4. Relevance distance and refutations


## [DAWN](../../papers/literature/3650200.3656600.pdf) 

### Questions
- What is the adjacency matrix?
- What is the WCC?
    - Stands for Weakly Connected Component
- What is the eccentricity of a node?
    - the maximal distance to any other node in the graph
- What is the average connected probability?
- What is the difference between CSR and CSC?

### Contents









## []() 
