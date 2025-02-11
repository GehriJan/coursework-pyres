

## Optimierungen
- Die Funktion `edge_neighb_of_subset` wird sehr sehr häufig aufgerufen. Vielleicht kann sie durch eine neighbour-matrix ersetzt werden, in der einmal berechnet wird, wer mit wem benachbart ist. eine überprüfung, wie sie in dieser Funktion stattfindet, kann dann auf einen look-up in dieser Matrix zurückgeführt werden.
- Wenn tatsächlich folgender Algorithmus aus David Plaisted's Paper implementiert wird: `for i = 1 step 1 until infinity do in parallel Rel_{i,S}(S')od`, dann könnte es sehr schecht skalieren, den SubGraph (also `S'`) immer neu zu berechnen. Stattdessen könnten alle Clauses mit einer distance gelabelt werden. Wenn dann der Subgraph mit Abstand `n+1` berechnet werden soll kann einfach zum Subgraph mit Abstand `n` die clauses aus `S\S'` hinzugefügt werden, die Abstand `n+1` haben
- Bei `edge_neighb_of_subset` und allgemein set/dict statt list nehmen, weil O(1) statt O(n)
- Allgemein Komplexität analysieren und optimieren.
- Kann ich den Graph nicht komplett als Matrix abbilden? ich bräuchte zwar trotzdem noch nodes für in/out, alle literale und so, aber vielleicht kann man die Konstruktion des Graphen vektorisieren und dann auch das Filtern nach relevance-neighbourhoods vektorisieren
- unterschiedliche Relevanzfunktionen über spezifizierte Klasse mit abstraken Funktionen implementieren?




















- Iwann mal Equality + AP untersuchen

