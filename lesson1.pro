d1(X) :- X mod 2 =:= 0 .

fact(N, F) :- N=< 0, F = 1.
fact(N, F) :- N > 0, 
      N1 is N - 2, fact(N1, F1), F is N * F1.


simple(N) :- simpleCalc(N, N).

simpleCalc(_, 2).
simpleCalc(N, K) :- K > 2, 
            K1 is K - 1 , N mod K1 =\= 0, simpleCalc(N, K1).


even(A) :- 0 is A mod 2.
notEven(A) :- 1 is A mod 2.

sirakuzCalc(A, X) :- even(A), X is A // 2 .
sirakuzCalc(A, X) :- notEven(A), X is 3*A + 1.

sirakuz(N, A0) :- N > 0 , A0 > 0, write(A0) , nl, 
      N1 is N - 1,sirakuzCalc(A0, A1), sirakuz(N1, A1). 


validMonth(A , N) :- A = jan, 0 < N, N =< 31.
validMonth(A , N) :- A = feb, 0 < N, N =< 29.
validMonth(A , N) :- A = mar, 0 < N, N =< 31.
validMonth(A , N) :- A = apr, 0 < N, N =< 30.
validMonth(A , N) :- A = may, 0 < N, N =< 31.
validMonth(A , N) :- A = jun, 0 < N, N =< 30.
validMonth(A , N) :- A = jul, 0 < N, N =< 31.
validMonth(A , N) :- A = aug, 0 < N, N =< 31.
validMonth(A , N) :- A = sep, 0 < N, N =< 30.
validMonth(A , N) :- A = oct, 0 < N, N =< 31.
validMonth(A , N) :- A = nov, 0 < N, N =< 30.
validMonth(A , N) :- A = dec, 0 < N, N =< 31.
lastDate(jan, N) :- N > 31.
lastDate(feb, N) :- N > 29.
lastDate(mar, N) :- N > 31.
lastDate(apr, N) :- N > 30.
lastDate(may, N) :- N > 31.
lastDate(jun, N) :- N > 30.
lastDate(jul, N) :- N > 31.
lastDate(aug, N) :- N > 31.
lastDate(sep, N) :- N > 30.
lastDate(nov, N) :- N > 31.
lastDate(oct, N) :- N > 30.
lastDate(dec, N) :- N > 31.
nextMonth(jan, feb).
nextMonth(feb, mar).
nextMonth(mar, apr).
nextMonth(apr, may).
nextMonth(may, jun).
nextMonth(jun, jul).
nextMonth(jul, aug).
nextMonth(aug, sep).
nextMonth(sep, oct).
nextMonth(oct, nov).
nextMonth(nov, dec).
nextMonth(dec, jan).



nextDate(date(M1, D1), date(M2, D2)) :- validMonth(M1, D1), ND is D1 + 1, validMonth(M1, ND), date(M1, D1) = date(M2, D2).
nextDate(date(M1, D1), date(M2, D2)) :- validMonth(M1, D1), ND is D1 + 1, lastDate(M1, ND), nextMonth(M1, NM), date(M2, D2) = date(NM, 1). 


