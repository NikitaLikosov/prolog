toSquares(X, Y, N) :- X =:= Y, N = 1.
toSquares(X, Y, N) :- X > Y, Z is X - Y, toSquares(Y, Z, N1), N is N1 + 1.
toSquares(X, Y, N) :- X < Y, Z is Y - X, toSquares(X, Z, N1), N is N1 + 1.

notContains(X, Y) :- X < 0, X1 is -X, notContains(X1, Y).  
notContains(X, Y) :- X = 0.
notContains(X, Y) :- X > 0, Y =\= X mod 10,X1 is X // 10 , notContains(X1, Y).


qntDigit(X, Y, Z, R) :- Y < X, R = 0.
qntDigit(X, Y, Z, R) :- X =:= 0, qntDigit(1,Y,Z,R1), R is R1 + 1.
qntDigit(X, Y, Z, R) :- X =< Y, X =\= 0, notContains(X, Z), X1 is X + 1, qntDigit(X1,Y,Z,R). 
qntDigit(X, Y, Z, R) :- X =< Y, X =\= 0, \+ notContains(X, Z), X1 is X + 1, qntDigit(X1,Y,Z,R1), R is R1 + 1.
