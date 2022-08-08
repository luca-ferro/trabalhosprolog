% Ordenação por Troca em ordem decrescente
% - Para realizar a mudança de ordem, é necessário
%   apenas que o operador lógico < seja alterado pelo
%   operador >, que vai ordenar os números por relação
%   de tamanho.

ap([],L,L).
ap([A|B],C,[A|D]) :- ap(B,C,D).

ordemTroca(L,S) :-
	ap(X,[A,B|C],L), B > A, !,
	ap(X,[B,A|C],Li),
	ordemTroca(Li,S).
ordemTroca(L,L).
% Exemplo: ordemTroca([2,4,8,6,7,3,1,5],S).

%-------------------------------------------------------------

% Ordenação por Quick Sort em ordem decrescente
% - Para realizar a mudança de ordem, é necessário
%   alterar os sinais na função "particao", que vão
%   movimentar o pivô de maneira contrária ao esperado,
%   invertendo os sinais de >= por < e vice-versa.

particao([X|L], Pivo, [X|Menores], Maiores) :-
	X >= Pivo, !, particao(L, Pivo, Menores, Maiores).
particao([X|L], Pivo, Menores,[X|Maiores]) :-
	X < Pivo, !, particao(L, Pivo, Menores, Maiores).
particao([],_,[],[]).

qSort([A|B], S) :-
	particao(B,A,Me,Ma),
	qSort(Me,MeOrd),
	qSort(Ma,MaOrd),
	ap(MeOrd,[A|MaOrd], S).
qSort([],[]).