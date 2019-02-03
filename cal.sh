yacc -d cal.y
lex cal.l
gcc lex.yy.c y.tab.c
./a.out