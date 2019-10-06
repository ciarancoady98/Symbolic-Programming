numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y):-numeral(X),numeral(Y).
add2(0,0,0).
add2(0,A,B):-add2(A,0,B).
add2(s(X),Y,s(Z)) :- add2(X,Y,Z).
add2(s(A+B),C,s(D)) :- add2(A+B,C,D).
add2(A+B,C,D) :- add2(A,B,E),add2(E,C,D).