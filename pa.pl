/*
	a) Considere a seguinte tabela de salários:
		* até 700,00 ------------------classe D
		de 701,00 até 3.500,00 --------classe C
		de 3.501,00 até 9.500,00 ------classe B
		acima de 9.500,00 -------------classe A
		Escreva um programa em PROLOG que receba o salário do usuário e informe sua classe salarial.
	Exemplo:
	?- informa_classe(1500, X).
		X = C.
*/

classe_A(9500,1000000,classe_a).
classe_B(3501,9500,classe_b).
classe_C(701,3500,classe_c).
classe_D(0,700,classe_d).

classe(X,Y):-
	(classe_A(A,B,Y), X > A, X =< B),!;(classe_B(A,B,Y), X>=A,X=<B),!;(classe_C(A,B,Y),X>=A,X=<B),!;(classe_D(A,B,Y),X>=A,X=<B),!.
