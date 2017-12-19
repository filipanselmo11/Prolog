/*
	d) Fazer um programa para receber um elemento e uma lista e inserir esse elemento no
	início da lista.
	NÃO usar a função remover, conforme mostrado em aula.
	Exemplo:
	?- inserir(a,[p, q, r],S).
	S = [a, p, q, r].
*/

inserir(X,Y,[X|Y]).
