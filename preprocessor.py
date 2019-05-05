from sys import stdin
import random as rd
lines = open("questions", "r").read().splitlines()
category = None
facts = []
cnt = dict()
for line in lines:
    if( len(line)< 2 ): continue
    if( line.startswith('?')): continue
    if( line.startswith('*')):
        category = line[1:].split(' ')[0]
        cnt[category] = 0.0
    else:
        fact = line.split(',')
        fact.append(category)
        facts.append(fact)
        cnt[category] = cnt[category]+1
rd.shuffle( facts )

# Create Facts 1
for question,increase,type  in facts:
    increase = 1 if increase is '+' else -1
    fact = "question('{}', {}, '{}',{})." .format(question,
                  1./cnt[type],
                  type, increase)
    print( fact )

# Create Facts 2
lines = open("books", "r").read().splitlines()
for line in lines:
    if( len(line)< 2 ): continue
    if( line.startswith('?')): continue
    if( line.startswith('*')):
        category = line[1:].split(' ')[0]
        continue
    score, name, author, *categories = line.split(',')
    for category in categories:
        book = "book({},'{}','{}','{}').".format(score, name, author, category)
        print(book)
