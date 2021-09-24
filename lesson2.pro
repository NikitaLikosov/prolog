% toSquares(X, X, N) :- N = 1.
% toSquares(X, Y, N) :- X > Y, Z is X - Y, toSquares(Y, Z, N1), N is N1 + 1.
% toSquares(X, Y, N) :- X < Y, Z is Y - X, toSquares(X, Z, N1), N is N1 + 1.

% notContains(X, Y) :- X < 0, X1 is -X, notContains(X1, Y).  
% notContains(X, Y) :- X = 0.
% notContains(X, Y) :- X > 0, Y =\= X mod 10,X1 is X // 10 , notContains(X1, Y).

% 2
contains(0, 0).
contains(X, Y) :- X < 0, X1 is -X, calcContains(X1, Y).
contains(X, Y) :- X > 0, calcContains(X, Y).
calcContains(X, Y) :-  X > 0, Y =\= X mod 10, X1 is X//10, calcContains(X1, Y) .
calcContains(X, Y) :- X > 0, Y =:= X mod 10.

qntDigit(X, X, Z, R) :- contains(X, Z), R = 1.
qntDigit(X, X, Z, R) :- \+ contains(X, Z), R = 0.
qntDigit(X, Y, Z, R) :- X < Y, \+ contains(X, Z), X1 is X + 1, qntDigit(X1,Y,Z,R). 
qntDigit(X, Y, Z, R) :- X < Y, contains(X, Z), X1 is X + 1, qntDigit(X1,Y,Z,R1), R is R1 + 1.


% 3
fact(N, F):- number(N), N > 0, calcFact(N, F).
fact(N, F):- number(F), F > 0, 
      calcNumberFact(0, F, R), R = N.

fact(N, F):- var(N), var(F), factCycle(0, N, F).

factCycle(K, N, F):- N = K, calcFact(K, F1), F1 = F.
factCycle(K, N, F):- K1 is K + 1, factCycle(K1, N, F).

calcFact(N, F) :- N=< 0, F = 1.
calcFact(N, F) :- N > 0, 
      N1 is N - 1, calcFact(N1, F1), F is N * F1.

calcNumberFact(N, F, R):- calcFact(N, F1), F1 < F, N1 is N + 1,  calcNumberFact(N1 , F, R).
calcNumberFact(N, F, R):- calcFact(N, F1), F1 =:= F, R = N.

% DONE
% 4 a
% ошибка insert(tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil)),100 ,tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,tr(101,nil,nil)))).
% правильно insert(tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil)),100 ,tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,tr(100,nil,nil)))).
% элемент уже в дереве но деревья разные insert(tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil)),3 ,tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,tr(100,nil,nil)))).
% элемент уже в дереве деревья одинаковые insert(tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil)),3 ,tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil))).

insert(nil, X, NT):- NT = tr(X, nil, nil).
insert(tr(Tdata, LT, RT), X, NT):- \+ var(NT) ,\+ NT = tr(Tdata, LT, RT) ,X > Tdata, insert(RT, X, NT1), NT = tr(Tdata, LT,  NT1).
insert(tr(Tdata, LT, RT), X, NT):- \+ var(NT) ,\+ NT = tr(Tdata, LT, RT) ,X < Tdata, insert(LT, X, NT1), NT = tr(Tdata, NT1, RT).
insert(tr(Tdata, LT, RT), X, NT):- var(NT),X > Tdata, insert(RT, X, NT1), NT = tr(Tdata, LT,  NT1).
insert(tr(Tdata, LT, RT), X, NT):- var(NT),X < Tdata, insert(LT, X, NT1), NT = tr(Tdata, NT1, RT).
insert(T, X, T):- findOnTree(T, X).

% DONE
% consult('C:/progects/prolog/lesson2.pro').
% 4 b
% findOnTree(tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil)), 3).
% findOnTree(tr(1,nil,nil), 3).


findOnTree(tr(_, _, RT), X):- var(X), findOnTree(RT, X).
findOnTree(tr(_, LT, _), X):- var(X), findOnTree(LT, X).
findOnTree(tr(X, _, _), X):- number(X).
findOnTree(tr(Tdata, _, RT), X):- number(X), X > Tdata, findOnTree(RT, X).
findOnTree(tr(Tdata, LT, _), X):- number(X), X < Tdata, findOnTree(LT, X).

% % 4 в отслеживать верхнюю границу
% % isSearchTree(tr(8, tr(3,tr(1,nil,nil),tr(6,nil,nil)), tr(10,nil,nil))).
% isSearchTree(tr(Tdata, LT, RT)):- Inf is Tdata - 1, calcIsSearchTree(tr(Tdata, LT, RT),Inf,Tdata).
% % write(Tdata),write(Inf),write(Sup),
% calcIsSearchTree(tr(Tdata, LT, RT), Inf, Sup):- write(Tdata),write(Inf),write(Sup), nl, Tdata > Inf, Tdata =< Sup,calcIsSearchTree(LT, Inf, Tdata),calcIsSearchTree(RT, Tdata, Sup).
% calcIsSearchTree(nil).