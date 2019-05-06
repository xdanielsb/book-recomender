question('I love life', 0.14285714285714285, 'Agreeableness',1).
question('I have a vivid imagination', 0.16666666666666666, 'Conscientiousness',1).
question('I do not like poetry', 0.16666666666666666, 'Openness',-1).
question('I look at the bright side of life', 0.16666666666666666, 'Openness',1).
question('I am indifferent to the feelings of others', 0.16666666666666666, 'Neuroticism',1).
question('I do not handle task in order', 0.16666666666666666, 'Conscientiousness',-1).
question('I do not have time to other people', 0.14285714285714285, 'Agreeableness',-1).
question('I am not methodical', 0.16666666666666666, 'Conscientiousness',-1).
question('I think highly of myself', 0.14285714285714285, 'Agreeableness',-1).
question('I avoid crowds', 0.2, 'Extraversion',-1).
question('I often feel sad', 0.16666666666666666, 'Neuroticism',1).
question('I have problems making friends', 0.16666666666666666, 'Openness',-1).
question('I get angry easily', 0.14285714285714285, 'Agreeableness',-1).
question('I keep other at a distance', 0.2, 'Extraversion',-1).
question('I am organized', 0.16666666666666666, 'Conscientiousness',1).
question('I feel comfortable around people', 0.2, 'Extraversion',1).
question('I dislike myself', 0.16666666666666666, 'Neuroticism',1).
question('I do just enough to get by', 0.16666666666666666, 'Neuroticism',1).
question('I take advantage of others', 0.14285714285714285, 'Agreeableness',-1).
question('I love reading challenging books and articles', 0.16666666666666666, 'Conscientiousness',1).
question('I work hard', 0.16666666666666666, 'Conscientiousness',1).
question('I keep my promises', 0.14285714285714285, 'Agreeableness',1).
question('I enjoy new experiences', 0.16666666666666666, 'Openness',1).
question('I like learning new things', 0.16666666666666666, 'Openness',1).
question('I prefer to be alone', 0.16666666666666666, 'Neuroticism',1).
question('I rarely notice my emotional reactions and feelings', 0.16666666666666666, 'Neuroticism',1).
question('I feel others emotions', 0.2, 'Extraversion',1).
question('I love to help others', 0.2, 'Extraversion',1).
question('I think art is important', 0.16666666666666666, 'Openness',1).
question('I shout and yell at people', 0.14285714285714285, 'Agreeableness',-1).
book(1.0,'Treasure Island','Stevenson','Adventure').
book(0.7,'The Hobbit','J.R.R. Tolkien','Adventure').
book(0.7,'The Hobbit','J.R.R. Tolkien','Science Fiction').
book(0.5,'Into thin Air','Jon Krakauer','Adventure').
book(0.3,'Wild','Cheryl Strayed','Adventure').
book(0.1,'The Call of the Wild',' Jack London','Adventure').
book(1.0,'The War of Art','Steven Pressfield','Self-Help').
book(0.7,'Brain Rules','John Medina','Self-Help').
book(0.5,'The 7 Habits of Highly Effective People','Stephen Covey','Self Help').
book(0.3,'The Telling Room','Paterniti','Biography').
book(0.1,'Barrel of Monkeys','Ruppert','Travel').
book(1.0,'Ender Game',' Orson Scott','Science.Fiction').
book(0.7,'Brave New World',' Leslie Holland','Dystopian').
book(0.7,'Brave New World',' Leslie Holland','Science Fiction').
book(0.5,'Fahrenheit 451','Ray Bradbury','Dystopian').
book(0.5,'Fahrenheit 451','Ray Bradbury','Science Fiction').
book(0.3,'The Time Machine','H. G. Wells','Romance').
book(0.3,'The Time Machine','H. G. Wells','Fantasy').
book(0.3,'The Time Machine','H. G. Wells','Science Fiction').
book(1.0,'1984','George Orwel','Science Fiction').
book(1.0,'1984','George Orwel','Dystopian').
book(0.7,'Great Expectations','Charles Dickens','Bildungsroman').
book(0.7,'Great Expectations','Charles Dickens','Social').
book(0.7,'Great Expectations','Charles Dickens','Critism').
book(0.5,'Me Before You','Jojo Moyes','Romance').
book(0.3,'My Sisters Keeper',' Jodi Picoult','Fiction').
book(1.0,'Pride and Prejudice','Jane Austen','Satire').
book(1.0,'Pride and Prejudice','Jane Austen','Romance').
book(0.7,'Love Story',' Erich Segal','Fiction').
book(0.7,'Love Story',' Erich Segal','Romance').
book(0.5,'Fifty Shades of Grey','E. L. James','Fiction').
book(0.5,'Fifty Shades of Grey','E. L. James','Romance').
book(0.5,'Fifty Shades of Grey','E. L. James','Erotic').
book(0.3,'Jane Eyre','Charlotte Bronte',' Gothic').
book(0.3,'Jane Eyre','Charlotte Bronte','Bildungsroman').
book(0.3,'Jane Eyre','Charlotte Bronte','Romance').
relation('Agreeableness','Science Fiction').
relation('Neuroticism','Critism').
relation('Openness','Fantasy').
relation('Openness','Science Fiction').
relation('Agreeableness','Adventure').
relation('Neuroticism','Bildungsroman').
relation('Neuroticism','Romance').
relation('Extraversion','Fiction').
relation('Openness','Science.Fiction').
relation('Openness','Dystopian').
relation('Conscientiousness','Self Help').
relation('Extraversion',' Gothic').
relation('Neuroticism','Social').
relation('Extraversion','Satire').
relation('Neuroticism','Fiction').
relation('Extraversion','Erotic').
relation('Extraversion','Romance').
relation('Conscientiousness','Travel').
relation('Extraversion','Bildungsroman').
relation('Conscientiousness','Self-Help').
relation('Conscientiousness','Biography').
relation('Neuroticism','Science Fiction').
relation('Neuroticism','Dystopian').
relation('Openness','Romance').


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

showRecommends([]):-!.
showRecommends([(_, Name, Author, Category)|T]):-
  write("----------------------------"),nl,
  write("\tName  = "),write(Name), nl,
  write("\tAuthor = "),write(Author), nl,
  write("\tGenre = "),write(Category), nl,
  showRecommends(T).


init:-
  questions(L),
  random_permutation(L, L2),
  play(L2, [] , R2),
  msort(R2, R3),
  computeProbs(R3,[], R4 ),
  recommend(R4, [], Res),
  showRecommends( Res ).

  % Logic to add the categories
  % Logic to recommend categories and books
