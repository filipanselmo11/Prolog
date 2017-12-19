/*
	1. Considere a seguinte descrição de laços familiares:
	João e Maria são casados e tiveram os filhos Joaquim e Joaquina.
	Joaquim casou-se com Andreia e tiveram as filhas Marina e Martinha.
	Joaquina casou-se com Armando e tiveram os filhos Hugo, Artur e Balbina.
	Alcides é filho de Martinha e Justino, pois estes dois últimos casaram.
	Jorge é filho de Balbina e André, que são casados.
	Alcineia é filha de Jorge e mãe de Estevão.
	Alcides e Gilda são os pais de Augusta.
	Construa um programa em PROLOG com os fatos pai/2, mãe/2, homem/1, mulher/1, casado/2.
	Acrescente ao programa regras para definir os predicados a seguir:
	- irmão, irmã, tio, tia, avô, avó, primo, sogro, nora, neto.
	- Todos os antecedentes de uma pessoa.
	- Todos os descendentes de uma pessoa.
*/

% x  pai de Y
pai(joao,joaquim).
pai(joao,joaquina).
pai(joaquim,marina).
pai(joaquim,martinha).
pai(alcindo,hugo).
pai(alcindo,artur).
pai(alcindo,balbina).
pai(justino,alcides).
pai(andre,jorge).
pai(jorge,alcineia).
pai(alcides,augusta).

% x é mae de y
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

% x é mulher
mulher(maria).
mulher(andreia).
mulher(joaquina).
mulher(marina).
mulher(martinha).
mulher(balbina).
mulher(alcineia).
mulher(augusta).

% x é homem
homem(joao).
homem(joaquim).
homem(alcindo).
homem(justino).
homem(alcides).
homem(hugo).
homem(andre).
homem(jorge).
homem(estevao).
casado(joao,maria).
casado(joaquim,andreia).
casado(alcindo,joaquina).
casado(justino,martinha).
casado(andre,balbina).

% regra para encontrar quem gerou X
gerou(X,Y):- pai(X,Y);mae(X,Y).

% regra para encontra de quem x é filho
filho(X,Y):- homem(Y),pai(X,Y);mae(X,Y).

% regra para encontrar de quem x é filha
filha(X,Y):- mulher(Y),pai(X,Y);mae(X,Y).

%regra para encontrar avo
avo(X,Y):- homem(X),pai(X,Z),(pai(Z,Y);mae(Z,Y)).

%regra para encontrar avó
ava(X,Y):- mulher(X),mae(X,Z),(pai(Z,Y);mae(Z,Y)).

%regra para encontrar primo
primo(X,Y):- (pai(Z,X);mae(Z,X)),(tio(Z,Y);tia(Z,Y)).

% regra pra dizer que x é irmao de y
irmao(X,Y):- (pai(Z,Y),pai(Z,X)),(mae(Z,Y),mae(Z,X)),X\=Y.
irma(X,Y):- mulher(X),(pai(Z,X),pai(Z,Y));(mae(Z,X),mae(Z,Y)),filha(X,Z),X\=Y,!.

% regra para dizer que x é tio de Y
tio(X,Y):- homem(Y),gerou(Z,Y),irmao(Z,X).
tia(X,Y):- mulher(Y),gerou(Z,Y),irmao(Z,X).

% regra para dizer que x é ancestral de y
ancestral(X,Y):- (pai(X,Y);mae(X,Y)).
ancestral(X,Y):- (pai(X,Z);mae(X,Z)),ancestral(Z,Y).