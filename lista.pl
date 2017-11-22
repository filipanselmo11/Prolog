remover(X, L, L1).
remover(X, [X|Z], Z).
remover(X, [Y|Z], [Y|W]) :- remover(X, W, Z).
