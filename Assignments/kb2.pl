% Author: Ciarán Coady

% Question 1
% Write a DCG that accepts strings of the form u2v where u and v are strings
% over the alphabet {0, 1} such that the number of 0’s in u is twice the number
% of 1’s in v. For example,
%
% ?- s([0,1,0,1,2,0,0,1,0],L).

s --> zeros(CountZ),[2],ones(CountO),{CountZ =:= CountO*2}.

zeros(0) --> [].
zeros(NewCount) --> [0], zeros(Count), {NewCount is Count + 1}.
zeros(Count) --> [1], zeros(Count).

ones(0) --> [].
ones(NewCount) --> [1], ones(Count), {NewCount is Count + 1}.   
ones(Count) --> [0], ones(Count).

% Question 2
% (∗) three neighbouring houses that all have a different colour, namely red,
% blue, and green. People of different nationalities live in the different
% houses and they all have a different pet.
%
% write a DCG that outputs strings [Col1,Nat1,Pet1, Col2,Nat2,Pet2, Col3,Nat3,Pet3]
% satisyfing (∗), where the nationalities are english, spanish, japanese and
% the pets are jaguar, snail, zebra. 
%
% renamed to s2 to avoid conflict with question 1

s2 --> colour(C1), nationality(N1), pet(P1), colour(C2), nationality(N2), pet(P2), colour(C3), nationality(N3), pet(P3), {C1\=C2, C2\=C3, C1\=C3, N1\=N2, N2\=N3, N1\= N3, P1\=P2, P2\=P3, P1\=P3}.

colour([red]) --> [red].
colour([blue]) --> [blue].
colour([green]) --> [green].

nationality([english]) --> [english].
nationality([spanish]) --> [spanish].
nationality([japanese]) --> [japanese].

pet([jaguar]) --> [jaguar].
pet([snail]) --> [snail]. 
pet([zebra]) --> [zebra]. 


% Question 3
% Write a DCG that given a non-negative integer Sum, accepts lists of integers
% ≥ 1 that add up to Sum.
%
% Make an alphabet of potential numbers using mkList. Then using the Accumulator to 
% keep track of the current sum recursively add elements to our resulting list until
% the accumulator value hits 0. If we get to 0 then return list.
%
% renamed to sum to avoid conflict with other questions

sum(0) --> [].
sum(Number)--> [X], {mkList(Number,Alphabet), member(X,Alphabet), Accumulator is Number-X, Accumulator>=0}, sum(Accumulator).

%mkList(1) --> [1].
%mkList(Digit) -->[Digit], mkList(Ddigit), {Digit is Ddigit+1}, {Digit > -1}.
mkList(1, [1]).
mkList(Digit, [Digit|Tail]) :- Digit > 0, Ddigit is Digit-1, mkList(Ddigit, Tail).