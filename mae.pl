
progenitor(maria,joao).
progenitor(alexia,leon).
progenitor(joana,jose).
progenitor(julia,marcos).

feminino(maria).
feminino(alexia).
feminino(joana).
feminino(julia).

mae_de :- progenitor(X,Y),
             feminino(X),
             write('X'), write('é mãe de '),
             write(Y).
