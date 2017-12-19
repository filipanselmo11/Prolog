/*
	b) Elaborar um programa para somar os valores numéricos em uma lista.
	Exemplo: Feita a consulta
	?- soma([1,2,3,4],N).
	O sistema retorna: N = 10.
*/

soma([],0).
soma([Cabeca|Cauda], N):-
				soma(Cauda, N1),
				N is N1 + Cabeca.