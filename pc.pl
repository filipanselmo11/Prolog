/*
	c) fazer um programa para receber um valor numérico digitado pelo usuário, calcular o
	cubo do valor recebido e exibir o resultado.
	A digitação dos valores deve ser feita por uma rotina iterativa, que solicita um valor
	numérico do usuário, calcula e exibe o resultado e volta a solicitar outro valor. A
	digitação será encerrada quando o usuário digitar “fim”.
	Terminar com a mensagem “Fim de processamento”, exibida no monitor.
*/

numero :-
	write('digite numero: '),
	nl,read(X),processa(X).
processa(fim) :- !.
processa(N) :- C is N*N*N,
	write(C),nl,numero.
X = 'fim', write('Fim de processamento').