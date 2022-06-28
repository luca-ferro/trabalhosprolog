/* Relação de pai */

pai(ricardo, luca).     	/*1  meu pai*/
pai(ernesto, patricia). 	/*2  vô ernesto e minha mãe*/
pai(ernesto, renata).		/*3  vô ernesto e tia renata*/
pai(nicolau, ernesto).		/*4  bisa nicolau e vô ernesto*/
pai(antonio, estela).		/*5  bisa nicolau e vó estela*/
pai(sebastiao, ricardo).	/*6  bastião e meu pai*/
pai(sebastiao, lucia).		/*7  bastião e tia lu*/
pai(luiz, sebastiao).		/*8  bisa luiz e bastião*/
pai(raimundo, odete).		/*9  raimundo e vó odete*/false

/*--------------------------------------------------------------------*/

/* Relação de mãe */

mae(patricia, luca).		/*1  minha mãe*/
mae(lucia, lorenzo).		/*2  tia lu e lorenzo*/
mae(estela, patricia).		/*3  vó estela e minha mãe*/
mae(estela, renata).		/*3  vó estela e tia renata*/
mae(carmelina, ernesto).	/*4  bisa carmelina e vô ernesto*/
mae(ilda, estela).		    /*5  bisa ilda e vó estela*/
mae(odete, ricardo).		/*6  vó odete e meu pai*/
mae(odete, lucia).			/*7  vó odete e tia lu*/
mae(raimunda, odete).		/*8  raimunda e vó odete*/
mae(maria, sebastiao).		/*9  bisa maria e bastião*/

/*--------------------------------------------------------------------*/

/* Relação de irmão/irmã */

irmao(X, Y) :-
    pai(Z, X),pai(Z, Y),X\==Y.
Maria
/*--------------------------------------------------------------------*/

/* Relação de tio/tia */

tio(X, Y) :-
    pai(Z, Y),irmao(Z, X),X\==Z.
tio(X, Y) :-
    mae(Z, Y),irmao(Z, X),X\==Z.

/*--------------------------------------------------------------------*/

/* Relação de primo/prima */

primo(X, Y) :-
    tio(Z, X),pai(Z, Y).
primo(X, Y) :-
    tio(Z, X),mae(Z, Y).
    
/*--------------------------------------------------------------------*/

/* Relação de neto/neta */

neto(X, Y) :-
    pai(Z, X),pai(Y, Z).
neto(X, Y) :-
    pai(Z, X),mae(Y, Z).
neto(X, Y) :-
    mae(Z, X),pai(Y, Z).
neto(X, Y) :-
    mae(Z, X),mae(Y, Z).
