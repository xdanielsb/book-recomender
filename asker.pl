% utilitary functions

append(L,[], L):-!.
append([], L, L):-!.
append([X1|T1], L,[X1|T2]) :-
  append(T1, L, T2).

show([]):-!.
show([(X,_,_)|T]):-
  nl,write(X),nl, show(T).
questions(L) :- findall((X,Y,Z,W),question(X,Y,Z,W), L).

:-
 write('Hi User, you will be asked some questions with the final purpose to recommend you some books'),nl,nl,
 write('\t write a number from -7 to 7 to answer inclusive for each answer'),nl,nl,
 write('\t -7 means that you totally reject the statement and 7 means that you are completely agree.'),nl,nl.

play([], L, L):-!.
play([(Q,P,M,G)|T], L, Res)  :-
  %write('Your answer should be in range [-7 7]. , or  stop '),nl,nl,
   nl,write(Q), write(" = "),
   read(Ans),
   (
     (
      Ans = stop,
      play([],L, Res)
     );
     (
      play(T,[(M,Ans,P,G)|L], Res)
     )
   ).

computeProbs([], L, L):-!.
computeProbs([(M,Y,P,G)], L, Ans):-
  computeProbs([],[(M,Y,P,G)|L], Ans).
computeProbs([(M1,Y1,P1,G1),(M2,Y2,P2,G2)|T], L, Ans):-
  (
    (
      M1 = M2,
      P is (P1*Y1/7+P2*Y2/7),
      computeProbs([(M1, 7, P, 1)|T], L, Ans)
    );
    (
      computeProbs([(M2, Y2, P2, G2)|T], [(M1, Y1, P1, G1)|L], Ans)
    )
  ).

recommend([], L, L):-!.
recommend([(A,_,B,_)|T], L, Res):-
  relation(A, Category),
  findall( (Score, Name, Author, Category),( book(Score, Name, Author, Category), Score >= B),L2),
  append(L, L2, L3),
  recommend(T, L3, Res).

showRecommends(_,[]):-!.
showRecommends(4,_):-!.
showRecommends(Num, [(_, Name, Author, Category)|T]):-
  write("---------------Recommend #"), write(Num), write(" ---------------"),nl,
  write("\tName  = "),write(Name), nl,
  write("\tAuthor = "),write(Author), nl,
  write("\tGenre = "),write(Category), nl,
  Num2 is Num+1,
  showRecommends(Num2, T).

init:-
  [facts],
  questions(L),
  random_permutation(L, L2),
  play(L2, [] , R2),
  msort(R2, R3),
  computeProbs(R3,[], R4 ),
  recommend(R4, [], R5),
  sort(1, @>=, R5, Res),
  showRecommends( 1, Res ).


  % Logic to add the categories
  % Logic to recommend categories and books
