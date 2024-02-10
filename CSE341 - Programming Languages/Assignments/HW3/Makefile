gpp_lexer.out:	gpp_lexer.c
		
		lex -o gpp_lexer.c gpp_lexer.l
		cc -g gpp_lexer.c y.tab.c -ll -o gpp_interpreter.out

clean:
		rm gpp_interpreter.out