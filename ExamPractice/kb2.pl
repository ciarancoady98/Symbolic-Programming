lenAcc([],Acc,Acc).
lenAcc([_|T],Acc,L):-NewAcc is Acc + 1, lenAcc(T,NewAcc,L).