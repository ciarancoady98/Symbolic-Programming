child(bridget,caroline).
child(caroline,donna).
descend(X,Y):-child(X,Y).
descend(X,Y):-descend(X,Y),descend(Z,Y).