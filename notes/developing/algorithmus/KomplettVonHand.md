# PUZ002 von Hand

## Graphen definieren:
Nodes:
```<Literal, Clause, in>```
```<Literal, Clause, out>```


Clauses:
1 - { ~ in_house(Cat),              cat(Cat)                }
2 - { ~ gazer(Gazer),               suitable_pet(Gazer)     }
3 - { ~ detested(Detested),         avoided(Detested)       }
4 - { ~ carnivore(Carnivore),       prowler(Carnivore)      }
5 - { ~ cat(Cat),                   mouse_killer(Cat)       }
6 - { ~ takes_to_me(Taken_animal),  in_house(Taken_animal)  }
7 - { ~ kangaroo(Kangaroo),       ~ suitable_pet(Kangaroo)  }
8 - { ~ mouse_killer(Killer),       carnivore(Killer)       }
9 - {   takes_to_me(Animal),        detested(Animal)        }
10- { ~ prowler(Prowler),           gazer(Prowler)          }
11- {   kangaroo(the_kangaroo)                              }
12- { ~ avoided(the_kangaroo)                               }

## Unifizierbar-Matrix:
Linked: 1, Not Linked: 0
    1   2   3   4   5   6   7   8   9   10  11  12
1   0   0   3   3   1   1   0   2   2   0   0   0 
2       0   0   2   0   0   1   3   0   1   2   0
3           0   0   0   2   0   0   1   0   0   1
4               0   2   0   0   1   0   1   0   0
5                   0   0   0   1   0   0   0   0
6                       0   0   0   1   0   0   0
7                           0   0   0   0   1   0
8                               0   0   0   0   0
9                                   0   0   0   0
10                                      0   0   0
11                                          0   0
12                                              0

    1   2   3   4   5   6   7   8   9   10  11  12
1   =   x   x   x   1   1   x   x   x   x   x   x 
2       =   x   x   x   x   1   x   x   1   x   x
3           =   x   x   x   x   x   1   x   x   1
4               =   x   x   x   1   x   1   x   x
5                   =   x   x   1   x   x   x   x
6                       =   x   x   1   x   x   x
7                           =   x   x   x   1   x
8                               =   x   x   x   x
9                                   =   x   x   x
10                                      =   x   x
11                                          =   x
12                                              =

    1   2   3   4   5   6   7   8   9   10  11  12
1   =   x   x   x   1   1   x   x   2   x   x   x 
2       =   x   x   x   x   1   x   x   1   x   x
3           =   x   x   x   x   x   1   x   x   1
4               =   x   x   x   1   x   1   x   x
5                   =   x   x   1   x   x   x   x
6                       =   x   x   1   x   x   x
7                           =   x   x   x   1   x
8                               =   x   x   x   x
9                                   =   x   x   x
10                                      =   x   x
11                                          =   x
12                                              =
    1   2   3   4   5   6   7   8   9   10  11  12
1   =   x   x   x   1   1   x   x   x   x   x   x 
2   x   =   x   x   x   x   1   x   x   1   x   x
3   x   x   =   x   x   x   x   x   1   x   x   1
4   x   x   x   =   x   x   x   1   x   1   x   x
5   1   x   x   x   =   x   x   1   x   x   x   x
6   1   x   x   x   x   =   x   x   1   x   x   x
7   x   1   x   x   x   x   =   x   x   x   1   x
8   x   x   x   1   1   x   x   =   x   x   x   x
9   x   x   1   x   x   1   x   x   =   x   x   x
10  x   1   x   1   x   x   x   x   x   =   x   x
11  x   x   x   x   x   x   1   x   x   x   =   x
12  x   x   1   x   x   x   x   x   x   x   x   =

Clauses:
1 - { ~ in_house(Cat),              cat(Cat)                }
< { ~in_house(Cat),cat(Cat)},~in_house(Cat),in>
< { ~in_house(Cat),cat(Cat)},~in_house(Cat),out>
< { ~in_house(Cat),cat(Cat)},cat(Cat),in>
< { ~in_house(Cat),cat(Cat)},cat(Cat),out>

2 - { ~ gazer(Gazer),               suitable_pet(Gazer)     }
< { ~ gazer(Gazer),suitable_pet(Gazer)},~gazer(Gazer),in>
< { ~ gazer(Gazer),suitable_pet(Gazer)},~gazer(Gazer),out>
< { ~ gazer(Gazer),suitable_pet(Gazer)},suitable_pet(Gazer),in>
< { ~ gazer(Gazer),suitable_pet(Gazer)},suitable_pet(Gazer),out>

3 - { ~ detested(Detested),         avoided(Detested)       }
< { ~ detested(Detested),avoided(Detested)},~detested(Detested),in>
< { ~ detested(Detested),avoided(Detested)},~detested(Detested),out>
< { ~ detested(Detested),avoided(Detested)},avoided(Detested),in>
< { ~ detested(Detested),avoided(Detested)},avoided(Detested),out>

4 - { ~ carnivore(Carnivore),       prowler(Carnivore)      }
< { ~ carnivore(Carnivore),prowler(Carnivore)},~ carnivore(Carnivore),in>
< { ~ carnivore(Carnivore),prowler(Carnivore)},~ carnivore(Carnivore),out>
< { ~ carnivore(Carnivore),prowler(Carnivore)},prowler(Carnivore),in>
< { ~ carnivore(Carnivore),prowler(Carnivore)},prowler(Carnivore),out>

5 - { ~ cat(Cat),                   mouse_killer(Cat)       }
<{ ~ cat(Cat),mouse_killer(Cat)} ~ cat(Cat),in>
<{ ~ cat(Cat),mouse_killer(Cat)} ~ cat(Cat),out>
<{ ~ cat(Cat),mouse_killer(Cat)}mouse_killer(Cat),in>
<{ ~ cat(Cat),mouse_killer(Cat)}mouse_killer(Cat),out>

6 - { ~ takes_to_me(Taken_animal),  in_house(Taken_animal)  }
<{ ~ takes_to_me(Taken_animal),in_house(Taken_animal)}, ~takes_to_me(Taken_animal), in>
<{ ~ takes_to_me(Taken_animal),in_house(Taken_animal)}, ~takes_to_me(Taken_animal), out>
<{ ~ takes_to_me(Taken_animal),in_house(Taken_animal)}, in_house(Taken_animal), in>
<{ ~ takes_to_me(Taken_animal),in_house(Taken_animal)}, in_house(Taken_animal), out>

7 - { ~ kangaroo(Kangaroo),       ~ suitable_pet(Kangaroo)  }
<{ ~ kangaroo(Kangaroo),~ suitable_pet(Kangaroo)},~kangaroo(Kangaroo), in>
<{ ~ kangaroo(Kangaroo),~ suitable_pet(Kangaroo)},~kangaroo(Kangaroo), out>
<{ ~ kangaroo(Kangaroo),~ suitable_pet(Kangaroo)},~suitable_pet(Kangaroo), in>
<{ ~ kangaroo(Kangaroo),~ suitable_pet(Kangaroo)},~suitable_pet(Kangaroo), out>

8 - { ~ mouse_killer(Killer),       carnivore(Killer)       }
<{ ~ mouse_killer(Killer),carnivore(Killer)}, ~mouse_killer(Killer), in>
<{ ~ mouse_killer(Killer),carnivore(Killer)}, ~mouse_killer(Killer), out>
<{ ~ mouse_killer(Killer),carnivore(Killer)}, carnivore(Killer), in>
<{ ~ mouse_killer(Killer),carnivore(Killer)}, carnivore(Killer), out>

9 - {   takes_to_me(Animal),        detested(Animal)        }
<{   takes_to_me(Animal),detested(Animal)},takes_to_me(Animal), in>
<{   takes_to_me(Animal),detested(Animal)},takes_to_me(Animal), out>
<{   takes_to_me(Animal),detested(Animal)},detested(Animal), in>
<{   takes_to_me(Animal),detested(Animal)},detested(Animal), out>

10- { ~ prowler(Prowler),           gazer(Prowler)          }
<{ ~ prowler(Prowler),gazer(Prowler)}, ~prowler(Prowler), in>
<{ ~ prowler(Prowler),gazer(Prowler)}, ~prowler(Prowler), out>
<{ ~ prowler(Prowler),gazer(Prowler)}, gazer(Prowler), in>
<{ ~ prowler(Prowler),gazer(Prowler)}, gazer(Prowler), out>

11- {   kangaroo(the_kangaroo)                              }
<{kangaroo(the_kangaroo)},kangaroo(the_kangaroo), in>
<{kangaroo(the_kangaroo)},kangaroo(the_kangaroo), out>

12- { ~ avoided(the_kangaroo)                               }
<{~ avoided(the_kangaroo),~ avoided(the_kangaroo), in}>
<{~ avoided(the_kangaroo),~ avoided(the_kangaroo), out}>


## Mit minus
    1["< { -in_house(Cat),cat(Cat)},-in_house(Cat),in>"]
    2["< { -in_house(Cat),cat(Cat)},-in_house(Cat),out>"]
    3["< { -in_house(Cat),cat(Cat)},cat(Cat),in>"]
    4["< { -in_house(Cat),cat(Cat)},cat(Cat),out>"]
    5["< { - gazer(Gazer),suitable_pet(Gazer)},-gazer(Gazer),in>"]
    6["< { - gazer(Gazer),suitable_pet(Gazer)},-gazer(Gazer),out>"]
    7["< { - gazer(Gazer),suitable_pet(Gazer)},suitable_pet(Gazer),in>"]
    8["< { - gazer(Gazer),suitable_pet(Gazer)},suitable_pet(Gazer),out>"]
    9["< { - detested(Detested),avoided(Detested)},-detested(Detested),in>"]
    10["< { - detested(Detested),avoided(Detested)},-detested(Detested),out>"]
    11["< { - detested(Detested),avoided(Detested)},avoided(Detested),in>"]
    12["< { - detested(Detested),avoided(Detested)},avoided(Detested),out>"]
    13["< { - carnivore(Carnivore),prowler(Carnivore)},- carnivore(Carnivore),in>"]
    14["< { - carnivore(Carnivore),prowler(Carnivore)},- carnivore(Carnivore),out>"]
    15["< { - carnivore(Carnivore),prowler(Carnivore)},prowler(Carnivore),in>"]
    16["< { - carnivore(Carnivore),prowler(Carnivore)},prowler(Carnivore),out>"]
    17["<{ - cat(Cat),mouse_killer(Cat)} - cat(Cat),in>"]
    18["<{ - cat(Cat),mouse_killer(Cat)} - cat(Cat),out>"]
    19["<{ - cat(Cat),mouse_killer(Cat)}mouse_killer(Cat),in>"]
    20["<{ - cat(Cat),mouse_killer(Cat)}mouse_killer(Cat),out>"]
    21["<{ - takes_to_me(Taken_animal),in_house(Taken_animal)}, -takes_to_me(Taken_animal), in>"]
    22["<{ - takes_to_me(Taken_animal),in_house(Taken_animal)}, -takes_to_me(Taken_animal), out>"]
    23["<{ - takes_to_me(Taken_animal),in_house(Taken_animal)}, in_house(Taken_animal), in>"]
    24["<{ - takes_to_me(Taken_animal),in_house(Taken_animal)}, in_house(Taken_animal), out>"]
    25["<{ - kangaroo(Kangaroo),- suitable_pet(Kangaroo)},-kangaroo(Kangaroo), in>"]
    26["<{ - kangaroo(Kangaroo),- suitable_pet(Kangaroo)},-kangaroo(Kangaroo), out>"]
    27["<{ - kangaroo(Kangaroo),- suitable_pet(Kangaroo)},-suitable_pet(Kangaroo), in>"]
    28["<{ - kangaroo(Kangaroo),- suitable_pet(Kangaroo)},-suitable_pet(Kangaroo), out>"]
    29["<{ - mouse_killer(Killer),carnivore(Killer)}, -mouse_killer(Killer), in>"]
    30["<{ - mouse_killer(Killer),carnivore(Killer)}, -mouse_killer(Killer), out>"]
    31["<{ - mouse_killer(Killer),carnivore(Killer)}, carnivore(Killer), in>"]
    32["<{ - mouse_killer(Killer),carnivore(Killer)}, carnivore(Killer), out>"]
    33["<{   takes_to_me(Animal),detested(Animal)},takes_to_me(Animal), in>"]
    34["<{   takes_to_me(Animal),detested(Animal)},takes_to_me(Animal), out>"]
    35["<{   takes_to_me(Animal),detested(Animal)},detested(Animal), in>"]
    36["<{   takes_to_me(Animal),detested(Animal)},detested(Animal), out>"]
    37["<{ - prowler(Prowler),gazer(Prowler)}, -prowler(Prowler), in>"]
    38["<{ - prowler(Prowler),gazer(Prowler)}, -prowler(Prowler), out>"]
    39["<{ - prowler(Prowler),gazer(Prowler)}, gazer(Prowler), in>"]
    40["<{ - prowler(Prowler),gazer(Prowler)}, gazer(Prowler), out>"]
    41["<{   kangaroo(the_kangaroo)},kangaroo(the_kangaroo), in>"]
    42["<{   kangaroo(the_kangaroo)},kangaroo(the_kangaroo), out>"]
    43["<{- avoided(the_kangaroo),- avoided(the_kangaroo), in}>"]
    44["<{- avoided(the_kangaroo),- avoided(the_kangaroo), out}>"]




# erstes komplettes flow chart
flowchart TD
    subgraph "-in_house(Cat),cat(Cat)" 
        1["-in_house(Cat),in"]
        2["-in_house(Cat),out"]
        3["cat(Cat),in"]
        4["cat(Cat),out"]
    end
    subgraph "-gazer(Gazer),suitable_pet(Gazer)"
        5["-gazer(Gazer),in"]
        6["-gazer(Gazer),out"]
        7["suitable_pet(Gazer),in"]
        8["suitable_pet(Gazer),out"]
    end
    subgraph "-detested(Detested),avoided(Detested)"
        9["-detested(Detested),in"]
        10["-detested(Detested),out"]
        11["avoided(Detested),in"]
        12["avoided(Detested),out"]
    end
    subgraph "-carnivore(Carnivore),prowler(Carnivore)"
        13["-carnivore(Carnivore),in"]
        14["-carnivore(Carnivore),out"]
        15["prowler(Carnivore),in"]
        16["prowler(Carnivore),out"]
    end
    subgraph "-cat(Cat),mouse_killer(Cat)"
        17["-cat(Cat),in"]
        18["-cat(Cat),out"]
        19["mouse_killer(Cat),in"]
        20["mouse_killer(Cat),out"]
    end
    subgraph "-takes_to_me(Taken_animal),in_house(Taken_animal)"
        21["-takes_to_me(Taken_animal),in"]
        22["-takes_to_me(Taken_animal),out"]
        23["in_house(Taken_animal),in"]
        24["in_house(Taken_animal),out"]
    end
    subgraph "-kangaroo(Kangaroo),-suitable_pet(Kangaroo)"
        25["-kangaroo(Kangaroo),in"]
        26["-kangaroo(Kangaroo),out"]
        27["-suitable_pet(Kangaroo),in"]
        28["-suitable_pet(Kangaroo),out"]
    end
    subgraph "-mouse_killer(Killer),carnivore(Killer)"
        29["-mouse_killer(Killer),in"]
        30["-mouse_killer(Killer),out"]
        31["carnivore(Killer),in"]
        32["carnivore(Killer),out"]
    end
    subgraph "takes_to_me(Animal),detested(Animal)"
        33["takes_to_me(Animal),in"]
        34["takes_to_me(Animal),out"]
        35["detested(Animal),in"]
        36["detested(Animal),out"]
    end
    subgraph "-prowler(Prowler),gazer(Prowler)"
        37["-prowler(Prowler),in"]
        38["-prowler(Prowler),out"]
        39["gazer(Prowler),in"]
        40["gazer(Prowler),out"]
    end
    subgraph "kangaroo(the_kangaroo)"
        41["kangaroo(the_kangaroo),in"]
        42["kangaroo(the_kangaroo),out"]
    end
    subgraph "-avoided(the_kangaroo),-avoided(the_kangaroo),in"
        43["-avoided(the_kangaroo),in"]
        44["-avoided(the_kangaroo),out"]
    end
    %% edges connecting the same literal in one clause
    1 ~~~ 2
    3 ~~~ 4
    5 ~~~ 6
    7 ~~~ 8
    9 ~~~ 10
    11 ~~~ 12
    13 ~~~ 14
    15 ~~~ 16
    17 ~~~ 18
    19 ~~~ 20
    21 ~~~ 22
    23 ~~~ 24
    25 ~~~ 26
    27 ~~~ 28
    29 ~~~ 30
    31 ~~~ 32
    33 ~~~ 34
    35 ~~~ 36
    37 ~~~ 38
    39 ~~~ 40
    41 ~~~ 42
    43 ~~~ 44

    %% edges marking different "paths" through the clauses
    1 <---> 4
    2 <---> 3

    5 <---> 8
    6 <---> 7

    9 <---> 12
    10 <---> 11

    13 <---> 16
    14 <---> 15

    17 <---> 20
    18 <---> 19

    21 <---> 24
    22 <---> 23

    25 <---> 28
    26 <---> 27

    29 <---> 32
    30 <---> 31

    33 <---> 36
    34 <---> 35
    
    37 <---> 40
    38 <---> 39

    %%connections between clauses
    2 ---> 23
    4 ---> 17
    6 ---> 39
    8 ---> 27
    10 ---> 35
    12 ---> 43
    14 ---> 31
    16 ---> 37
    18 ---> 3
    20 ---> 29
    22 ---> 33
    24 ---> 1
    26 ---> 41
    28 ---> 7
    30 ---> 19
    32 ---> 13
    34 ---> 21
    36 ---> 9
    38 ---> 15
    40 ---> 5
    42 ---> 25
    44 ---> 11



# Breadth-First-Search:

Von:
"-avoided(the_kangaroo),in"
"-avoided(the_kangaroo),out"

Node                                Graph Distanz   RelevanzDistanz
"-in_house(Cat),in"                 7               
"-in_house(Cat),out"                7
"cat(Cat),in"                       8               5   
"cat(Cat),out"                      8               5
"-gazer(Gazer),in"                  17
"-gazer(Gazer),out"                 17
"suitable_pet(Gazer),in"            18              10
"suitable_pet(Gazer),out"           18              10
"-detested(Detested),in"            2               2
"-detested(Detested),out"           2               2
"avoided(Detested),in"              1
"avoided(Detested),out"             1
"-carnivore(Carnivore),in"          13
"-carnivore(Carnivore),out"         13
"prowler(Carnivore),in"             14              8
"prowler(Carnivore),out"            14              8
"-cat(Cat),in"                      9
"-cat(Cat),out"                     9
"mouse_killer(Cat),in"              10              6
"mouse_killer(Cat),out"             10              6
"-takes_to_me(Taken_animal),in"     5
"-takes_to_me(Taken_animal),out"    5
"in_house(Taken_animal),in"         6               4
"in_house(Taken_animal),out"        6               4
"-kangaroo(Kangaroo),in"            20              11
"-kangaroo(Kangaroo),out"           20              11
"-suitable_pet(Kangaroo),in"        19
"-suitable_pet(Kangaroo),out"       19
"-mouse_killer(Killer),in"          11
"-mouse_killer(Killer),out"         11
"carnivore(Killer),in"              12              7
"carnivore(Killer),out"             12              7
"takes_to_me(Animal),in"            4               3
"takes_to_me(Animal),out"           4               3
"detested(Animal),in"               3
"detested(Animal),out"              3
"-prowler(Prowler),in"              15
"-prowler(Prowler),out"             15
"gazer(Prowler),in"                 16              9
"gazer(Prowler),out"                16              9
"kangaroo(the_kangaroo),in"         21
"kangaroo(the_kangaroo),out"        21
"-avoided(the_kangaroo),in"         0