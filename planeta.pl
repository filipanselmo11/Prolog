distancia(mercurio, 36).
distancia(venus, 67).
distancia(terra, 93).
distancia(marte, 141).
distancia(jupiter, 484).
distancia(saturno, 886).
distancia(urano, 1790).
distancia(netuno, 2900).

dist(PL1, PL2, DT) :- distancia(PL1, D1),
                      distancia(PL2, D2),
                      DT is abs(D1 - D2).

