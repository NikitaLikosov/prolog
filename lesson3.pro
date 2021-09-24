% consult('C:/progects/prolog/lesson3.pro').

% DONE
% pred1([1, 2, 3], [3, 2, 1]).
pred1(A, B):- pred1Calc(A, [], B).

pred1Calc([AHead | ABody], B, NB):- B1 = [AHead | B], pred1Calc(ABody, B1, NB).
pred1Calc([], B, NB):- B = NB.

% palindrome(['a', 'c', 'c', 'A']).
% palindrome(['a', 'c', 'B']).
palindrome(A):- toLowerCaseArr(A, ALow), pred1(ALow, ARevLow), ARevLow = ALow.

toLowerCaseArr([AHead | ABody], B):- toLowerCase(AHead, X), toLowerCaseArr(ABody, B1), B = [X | B1].
toLowerCaseArr([], []).

toLowerCase(X, Y):- X = 'a', Y = 'a'.
toLowerCase(X, Y):- X = 'A', Y = 'a'.
toLowerCase(X, Y):- X = 'b', Y = 'b'.
toLowerCase(X, Y):- X = 'B', Y = 'b'.
toLowerCase(X, Y):- X = 'c', Y = 'c'.
toLowerCase(X, Y):- X = 'C', Y = 'c'.


% 2 unit
% DONE
% скопировал с lesson1
% pred2([2, 3, 10, 5, 12, 25, 11],[2, 3, 5, 11]).
simple(N) :- simpleCalc(N, N).
simpleCalc(_, 2).
simpleCalc(N, K) :- K > 2, 
            K1 is K - 1 , N mod K1 =\= 0, simpleCalc(N, K1).

pred2(A, B):- pred2Calc(A, B1),B1 = B.
pred2Calc([AHead | ABody], B):- simple(AHead),pred2Calc(ABody, B1), B = [AHead | B1].
pred2Calc([AHead | ABody], B):- \+ simple(AHead),pred2Calc(ABody, B).
pred2Calc([], []).


% 3 unit 
% DONE
% pred3_1([1, 2, 3], [1, 2, 3,4 ,5]).
pred3_1([AHead | ABody], [BHead | BBody]):- \+ var(BHead), \+ var(AHead), AHead = BHead, pred3_1(ABody, BBody).
pred3_1(A, _):- \+ var(A), A = [] .
pred3_1(A, A).

% pred3_2([1, 2, 3], [1, 2, 3,4 ,5]).
pred3_2(A, B):- pred3_1(A, B).
pred3_2(A, B):- \+ pred3_1(A, B), B = [_ | BBody], pred3_2(A, BBody).

% 4 unit
%  DONE
% pred4([1, 3, 5], [2, 3, 4 ,10, 11], C).
pred4(A, B, C):- pred4Calc(A,B, [], C).
pred4Calc([AHead | ABody], [BHead | BBody], C, R):- AHead =< BHead , pred4Calc(ABody, [BHead | BBody] , [AHead | C], R).
pred4Calc([AHead | ABody], [BHead | BBody], C, R):- AHead > BHead , pred4Calc([AHead | ABody], BBody , [BHead | C], R). 
pred4Calc([AHead | ABody], [], C, R):- pred4Calc(ABody, [] , [AHead | C], R).
pred4Calc([], [BHead | BBody], C, R):- pred4Calc([], BBody , [BHead | C], R).
pred4Calc([], [], C, R):- pred1(C, R).

% 5 unit
% DONE
%  numlst(123, X).
numlst(N, Lst):- \+var(N) ,N =:= 0, Lst = [0].
numlst(N, Lst):- \+var(N) ,N =\= 0, calcNumlst(N, [] ,Lst).
numlst(N, Lst):- var(N), var(Lst), iterNumlst(N, Lst, 0).
numlst(N, Lst):- var(N), calcReverseNumlist(0 , Lst, N).

iterNumlst(N, Lst, K):- N = K, calcNumlst(K, [], Lst).
iterNumlst(N, Lst, K):- K1 is K + 1, iterNumlst(N, Lst, K1).
calcNumlst(0, X, X).
calcNumlst(N, Acc,Lst):- N =\= 0, X is N mod 10, N1 is N // 10, calcNumlst(N1, [X | Acc], Lst).
calcReverseNumlist(N, [], N).
calcReverseNumlist(N, [Head | Body], R):- N1 is N*10 + Head, calcReverseNumlist(N1, Body, R).

