numeral(0).
numeral(-X) :- numeral(X).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y):-numeral(X),numeral(Y).
numeral(X-Y) :- numeral(X), numeral(Y).


add2(0,0,0).
add2(0,A,B):-add2(A,0,B).
add2(-X,Y,Z):-minus(X,P),add2(P,Y,Z).
add2(X,-Y,Z):-minus(Y,P),add2(X,P,Z).
add2(p(X),s(Y),Z):-add2(X,Y,Z).
add2(s(X),p(Y),Z):-add2(X,Y,Z).
add2(p(s(X)),Y,Z):-add2(X,Y,Z).
add2(s(p(X)),Y,Z):-add2(X,Y,Z).
add2(s(X),Y,s(Z)) :- add2(X,Y,Z).
add2(p(X),Y,p(Z)) :- add2(X,Y,Z).
add2(s(A+B),C,s(D)) :- add2(A+B,C,D).
add2(s(A-B),C,s(D)) :- add2(A-B,C,D).
add2(A+B,C,D) :- add2(A,B,E),add2(E,C,D).
add2(A-B,C,D) :- add2(A,-B,E),add2(E,C,D).

minus(0,Z):-Z=0.
minus(s(p(X)),Z):-minus(X,Z).
minus(p(s(X)),Z):-minus(X,Z).
minus(s(X),p(Z)):-minus(X,Z).
minus(p(X),s(Z)):-minus(X,Z).
minus(X+Y,Z):-add2(X,Y,P),minus(P,Z).
minus(X-Y,Z):-add2(-X,Y,Z).

subtract(X,-Y,Z):-add2(X,Y,Z).
subtract(X,Y,Z):-add2(X,-Y,Z).
subtract(-X,-Y,Z):-add2(-X,Y,Z).
