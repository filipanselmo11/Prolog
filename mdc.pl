

mdc(X, X, X).
mdc(X, Y, Z) :- X > Y,
                W is X - Y,
                mdc(Y, W, Z).

mdc(X, Y, Z) :- X < Y,
                mdc(Y, X, Z).

            
