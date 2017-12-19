% X é pai de Y %
pai(joao,joaquim).
pai(joao,joaquina).
pai(joaquim,marina).
pai(joaquim,martinha).
pai(alcindo,hugo).
pai(alcindo,balbina).
pai(justino,alcides).
pai(andre,jorge).
pai(jorge,alcineia).
pai(alcides,augusta).

% X é mãe de Y %
mae(maria,joaquim).
mae(maria,joaquina).
mae(andreia,marina).
mae(andreia,martinha).
mae(joaquina,hugo).
mae(joaquina,artur).
mae(joaquina,balbina).
mae(martinha,alcides).
mae(balbina,jorge).
mae(alcineia,estevao).

% X é mulher %
mulher(maria).
mulher(andreia).
mulher(joaquina).
mulher(marina).
mulher(martinha).
mulher(balbina).
mulher(alcineia).
mulher(augusta).

% X é homem %
homem(joao).
homem(joaquim).
homem(alcindo).
homem(hugo).
homem(justino).
homem(alcides).
homem(hugo).
homem(andre).
homem(jorge).
homem(alcides).
homem(estevao).

% X é casado com Y %
casado(joao,maria).
casado(joaquim,andreia).
casado(alcindo,joaquina).
casado(justino,martinha).
casado(andre,balbina).

% regra para encontrar quem gerou X %
gerou(X,Y):- pai(X,Y);mae(X,Y).

% regra pra encontrar de quem X é filho %
filho(X,Y):- homem(Y),pai(X,Y);mae(X,Y).

% regra pra encontrar de quem X é filha %
filha(X,Y):- mulher(Y),pai(X,Y);mae(X,Y).

% regra pra encontrar o avô %
avo1(X,Y):- homem(Y),pai(X,Z),(pai(Z,Y);mae(Z,Y)).

% regra pra encontrar a avó %
avo2(X,Y):- mulher(Y),pai(X,Z),(pai(Z,Y);mae(Z,Y)).

% regra pra encontrar o primo %
primo(X,Y):- (pai(Z,X);mae(Z,X)),(tio(Z,Y);tia(Z,Y)).

% regra pra dizer que X é irmao de Y %
irmao(X,Y):- (pai(Z,Y),pai(Z,X)),(mae(Z,Y),mae(Z,X)),X<>Y.
irma(X,Y):- mulher(X),(pai(Z,X),pai(Z,Y));(mae(Z,X),mae(Z,Y)),filha(X,Z),X<>Y,!.

% regra pra dizer que X é tio de Y %
tio(X,Y):- homem(Y),gerou(Z,Y),irmao(Z,X).
tia(X,Y):- mulher(Y),gerou(Z,Y),irmao(Z,X).

% regra pra dizer que X é ancestral de Y %
ancestral(X,Y):- (pai(X,Y);mae(X,Y)).
ancestral(X,Y):- (pai(X,Z);mae(X,Z)),ancestral(Z,Y).
