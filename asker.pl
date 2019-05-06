question('I take advantage of others', 0.14285714285714285, 'Agreeableness',-1).
question('I love to help others', 0.2, 'Extraversion',1).
question('I rarely notice my emotional reactions and feelings', 0.16666666666666666, 'Neuroticism',1).
question('I prefer to be alone', 0.16666666666666666, 'Neuroticism',1).
question('I look at the bright side of life', 0.16666666666666666, 'Openness',1).
question('I feel comfortable around people', 0.2, 'Extraversion',1).
question('I keep my promises', 0.14285714285714285, 'Agreeableness',1).
question('I love reading challenging books and articles', 0.16666666666666666, 'Conscientiousness',1).
question('I have a vivid imagination', 0.16666666666666666, 'Conscientiousness',1).
question('I shout and yell at people', 0.14285714285714285, 'Agreeableness',-1).
question('I am not methodical', 0.16666666666666666, 'Conscientiousness',-1).
question('I keep other at a distance', 0.2, 'Extraversion',-1).
question('I think art is important', 0.16666666666666666, 'Openness',1).
question('I like learning new things', 0.16666666666666666, 'Openness',1).
question('I dislike myself', 0.16666666666666666, 'Neuroticism',1).
question('I love life', 0.14285714285714285, 'Agreeableness',1).
question('I often feel sad', 0.16666666666666666, 'Neuroticism',1).
question('I am organized', 0.16666666666666666, 'Conscientiousness',1).
question('I do not like poetry', 0.16666666666666666, 'Openness',-1).
question('I enjoy new experiences', 0.16666666666666666, 'Openness',1).
question('I avoid crowds', 0.2, 'Extraversion',-1).
question('I feel others emotions', 0.2, 'Extraversion',1).
question('I think highly of myself', 0.14285714285714285, 'Agreeableness',-1).
question('I do not handle task in order', 0.16666666666666666, 'Conscientiousness',-1).
question('I do not have time to other people', 0.14285714285714285, 'Agreeableness',-1).
question('I work hard', 0.16666666666666666, 'Conscientiousness',1).
question('I get angry easily', 0.14285714285714285, 'Agreeableness',-1).
question('I do just enough to get by', 0.16666666666666666, 'Neuroticism',1).
question('I am indifferent to the feelings of others', 0.16666666666666666, 'Neuroticism',1).
question('I have problems making friends', 0.16666666666666666, 'Openness',-1).
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

% utilitary functions

append(X, Y, [X|Y]).
show([]):-!.
show([(X,_,_)|T]):-
  nl,write(X),nl, show(T).
questions(L) :- findall((X,Y,Z,W),question(X,Y,Z,W), L).

:-
 write('Hi User, you will be asked some questions with the final purpose to recommend you some books'),nl,nl,
 write('\t write a number from 0 to 7 to answer inclusive for each of the answer '),nl,nl,
 write('\t 0 means that you totally reject the statement and 7 means that you are completely agree.'),nl,nl.

play([], L, L):-!.
play([(Q,P,M,G)|T], L, Res)  :-
   write('Your answer should be in range [0 7], or stop '),nl,
   write(Q),nl,nl,
   play(T,[(P,M,G)|L], Res).

init(Res):-
  questions(L),
  play(L, [] , Res).
