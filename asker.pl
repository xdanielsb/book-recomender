% declare dynamics
:- dynamic book/4.

% utilitary functions
append(L,[], L):-!.
append([], L, L):-!.
append([X1|T1], L,[X1|T2]) :-
  append(T1, L, T2).

% logic to filter and show
show([]):-!.
show([(X,_,_)|T]):-
  nl,write(X),nl, show(T).
questions(L) :- findall((X,Y,Z,W),question(X,Y,Z,W), L).

listb:-
  forall(book(Score,Name,Author,Genre),(write(' - '),write(Score), write("\t"),write(Name),write('\t'),write(Author), write('\t'), writeln(Genre))).

% logic to read data
insert:-
  write("Write the Name of the book  = "), read(Name), nl,
  write("Author  = "), read(Author), nl,
  write("Genre = "), read(Genre), nl,
  write("Score (genre) of the book [0 100] = "), read(Score), nl,
  assertz(book(Score, Name, Author, Genre)).

% logic to play the game
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
  P1 is (Y*P/7),
  computeProbs([],[(M,Y,P1,G)|L], Ans).
computeProbs([(M1,Y1,P1,G1),(M2,Y2,P2,G2)|T], L, Ans):-
  (
    (
      M1 = M2,
      P is (P1*Y1/7+P2*Y2/7),
      computeProbs([(M1, 7, P, 1)|T], L, Ans)
    );
    (
      P3 is (P2*Y2/7),
      P4 is (P1*Y1/7),
      computeProbs([(M2, Y2, P3, G2)|T], [(M1, Y1, P4, G1)|L], Ans)
    )
  ).


getCategories([], L, L):-!.
getCategories([(A,_,B,_)|T], L, Res):-
  findall( (Category, B),( relation(A, Category)),L2),
  append(L, L2, L3),
  getCategories(T, L3, Res).

recommend([], L, L):-!.
recommend([(Cat,B)|T], L, Res):-
  findall( (Score, Name, Author, Category),( book(Score, Name, Author, Category), Score =< B, Category=Cat),L2),
  append(L, L2, L3),
  recommend(T, L3, Res).

showRecommends(_,[]):-!.
%showRecommends(4,_):-!. % uncomment if you junt want 3 recommendations
showRecommends(Num, [(_, Name, Author, Category)|T]):-
  write("---------------Recommend #"), write(Num), write(" ---------------"),nl,
  write("\tName  = "),write(Name), nl,
  write("\tAuthor = "),write(Author), nl,
  write("\tGenre = "),write(Category), nl,
  Num2 is Num+1,
  showRecommends(Num2, T).

init(Categories):-
  [facts],
  questions(L),
  random_permutation(L, L2),
  play(L2, [] , R2),
  msort(R2, R3),
  computeProbs(R3,[], R4 ),
  getCategories(R4, [], Categories),
  recommend(Categories,[], R5),
  sort(1, @>=, R5, Res),
  showRecommends( 1, Res ).

:-
 write('-----Hi User, you will be asked some questions with the final purpose to recommend you some books'),nl,
 write('\t (1) Write insert. to create a new book (take care with the case)'),nl,
 write('\t (2) Write listb. to list all books, in the database.'),nl,
 write('\t (3) Write a number from [-7 7] to answer each answer'),nl,nl,
 write('\t\t -7 means that you totally reject the statement \n\t\t 7 means that you are completely agree.'),nl,nl,nl,
 writeln('\t--------------------(Book Recommender)----------------------'),nl.
