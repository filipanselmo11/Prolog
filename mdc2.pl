mdc(X, 0, X).
mdc(X, Y, Z) :- X > Y,
                W is X mod Y,
                mdc(Y, W, Z).
mdc(X, Y, Z) :- X < Y,
                mdc(Y, X, Z).
                

