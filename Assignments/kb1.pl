numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y):-numeral(X),numeral(Y).
add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add2(A+B,C+D,E):-add(A,B,F),add(C,D,G),add(F,G,E).
add2(X+Y,Z,B):-add(X,Y,A),add(A,Z,B).
add2(X,Y+Z,B):-add(Y,Z,A),add(A,X,B).
