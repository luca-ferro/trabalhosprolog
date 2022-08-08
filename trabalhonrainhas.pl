apaga(X,[X|Y],Y).
apaga(A,[B|C],[B|D]) :- 
    apaga(A,C,D).

solucao(N,S) :- 
    crialista(N,L),
    criasup(N,DS),
    criainf(N,DI),
    resolve(S,L,L,DS,DI),
    tabuleiro(N,S).

resolve([],[],_,_,_).
resolve([C|LC],[L|LL],CO,DS,DI):-
    apaga(C,CO,CO1),
    NS is L - C,
    NI is L + C,
    apaga(NS,DS,DS1),
    apaga(NI,DI,DI1),
    resolve(LC,LL,CO1,DS1,DI1).

crialista(N,[N|L]) :- 
    N > 0,
    N1 is N-1, 
    crialista(N1,L).
crialista(0,[]).

criasup(L,DS) :- 
    L1 is -(L-1), 
    C1 is (L-1), 
    findall(X, between(L1,C1,X), DS).
criasup(0,0,[]).

criainf(L,DI) :- 
    L1 is 2*L, 
    findall(X, between(2,L1,X), DI).
criainf(0,0,[]).

linha(0, _) :- !.
linha(X, V) :- 
    X1 is X - 1, 
    linha(X1, V), 
    (X =:= V -> write('R'); 
    write('.')), 
    write(' ').

criatab(0, _, []) :- !.
criatab(X, Y, [A|B]) :- 
    linha(Y, A), 
    nl, 
    X1 is X - 1, 
    criatab(X1, Y, B).

tabuleiro(X, Y) :- 
    criatab(X, X, Y).