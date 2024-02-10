(defconstant kws '("and" "or" "not" "equal" "less" "nil" "list" "append" "concat" "set" "def" "for" "if" "exit" "load" "display" "true" "false"))
(defconstant ops '("+" "-" "/" "*" "(" ")" ","))
(defconstant dgt '("0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
(defconstant alpha '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))

(defun find_element(value my_list) ;; checking whether a given element in one of above lists.
    (if (find value my_list :test 'string=)
        t
        nil
    )

)

(defun check_for_parenthesis(token) ;; Because we are taking word by word, there might be some situations like "(sumup )". 
    (if (string= (subseq token 0 1) "(");; So we need to seperate ( ) from the words.
        (progn 
            (token_of (subseq token 0 1))
            (if (string= (subseq token (- (length token) 1)) ")") ;; This if checks for the situations like (x)
            (progn
                (token_of (subseq token 1 (- (length token) 1)))
                (token_of (subseq token (- (length token) 1)))
            )
            (token_of (subseq token 1 (length token))))
        )
        (progn
            (if (string= (subseq token (- (length token) 1)) ")");; This if checks for the situations like 123b12)
            (progn
                (token_of (subseq token 0 (- (length token) 1)))
                (token_of (subseq token (- (length token) 1)))
            )
            (token_of token)
            )
        )
    )
)


(defun token_of(token);; This function will check whether a given parsed entry is in the syntax or not
    (if (string= token ";;")
        (progn
        (format t "COMMENT ~%")
        (gppinterpreter )
        )
        (if (find_element token kws) ;; If word passed by is found in keywords, this if will return related token
            (cond 
                ((string-equal token "and")
                    (princ "KW_AND") (terpri))
                ((string-equal token "or")
                    (princ "KW_OR") (terpri)) 
                ((string-equal token "not")
                    (princ "KW_NOT") (terpri))
                ((string-equal token "equal")
                    (princ "KW_EQUAL") (terpri)) 
                ((string-equal token "less")
                    (princ "KW_LESS") (terpri))
                ((string-equal token "nil")
                    (princ "KW_NIL") (terpri)) 
                ((string-equal token "list")
                    (princ "KW_LIST") (terpri))
                ((string-equal token "append")
                    (princ "KW_APPEND") (terpri)) 
                ((string-equal token "concat")
                    (princ "KW_CONCAT") (terpri))
                ((string-equal token "set")
                    (princ "KW_SET") (terpri)) 
                ((string-equal token "def")
                    (princ "KW_DEF") (terpri))
                ((string-equal token "for")
                    (princ "KW_FOR") (terpri)) 
                ((string-equal token "if")
                    (princ "KW_IF") (terpri))
                ((string-equal token "exit")
                    (princ "KW_EXIT") (terpri)) 
                ((string-equal token "load")
                    (princ "KW_LOAD") (terpri))
                ((string-equal token "display")
                    (princ "KW_DISPLAY") (terpri)) 
                ((string-equal token "true")
                    (princ "KW_TRUE") (terpri))
                ((string-equal token "false")
                    (princ "KW_FALSE") (terpri))
            )
            (if (find_element token ops) ;; If word passed by is found in operators, this if will return related token
                (cond 
                    ((string-equal token "+")
                        (princ "OP_PLUS") (terpri))
                    ((string-equal token "-")
                        (princ "OP_MINUS") (terpri)) 
                    ((string-equal token "/")
                        (princ "OP_DIV") (terpri))
                    ((string-equal token "*")
                        (princ "OP_MULT") (terpri)) 
                    ((string-equal token "(")
                        (princ "OP_OP") (terpri))
                    ((string-equal token ")")
                        (princ "OP_CP") (terpri)) 
                    ((string-equal token ",")
                        (princ "OP_COMMA") (terpri))
                )
                (cond
                    ((find_element (string-downcase (subseq token 0 1)) alpha) ;; In this condition we are checking IDENTIFIERs
                        (let ((errorNum t))
                            (dotimes (i (length token))
                                (if (or (find_element (string-downcase (subseq token i (+ 1 i))) alpha) (find_element (string-downcase (subseq token i (+ 1 i))) dgt))
                                    ()
                                    (setq errorNum nil)
                                )
                            )
                            (if errorNum
                                (progn (princ "IDENTIFIER") 
                                    (terpri)
                                )
                                (format t "SYNTAX_ERROR ~a cannot be tokenized ~%" token)
                            )
                        )
                    )

                    ((find_element (string-downcase (subseq token 0 1)) dgt) ;; In this condition we are checking VALUEFs
                        (let ((errorNum t))
                            (dotimes (i (length token))
                                (if (or (string= (string-downcase (subseq token i (+ 1 i))) "b") (find_element (string-downcase (subseq token i (+ 1 i))) dgt))
                                    (if (search "b" token) ;; If b is not found in token and onyl consist of integers it will pass nil as errorNum
                                        ()
                                        (setq errorNum nil)
                                    )
                                    (setq errorNum nil)
                                )
                            )
                            (if errorNum
                                (progn (princ "VALUEF") 
                                    (terpri)
                                )
                                (format t "SYNTAX_ERROR ~a cannot be tokenized ~%" token)
                            )
                        )
                    )

                    (t (format t "SYNTAX_ERROR ~a cannot be tokenized ~%" token)) ;; If given words does not satisfy any conditions (if and cond) above this will give error
                )
                ) 
            )
    )
)

(defun find_all_occurrences (charac string) ;; We need this function because in the following lines I have taken entries as a line and seperate them by space characters occurance
  (let ((positions '())) ;; We need a list to keep indexes.
    (dotimes (i (length string)) ;; Using this loop we will loop through the string and find occurances.
      (when (char= charac (elt string i)) ;; charac is the character that we are looking for using elt function if in index i we have charac,
        (push i positions))) ;; it pushes i to the list.
        (push (length string) positions) ;; Because we are using loop for element below we need extra element at the end of our l
    (reverse positions)));; Because we are pushing we need to reverse the list at the end so that we will have indexes respectively.

(defun entry_parser() ;; Function that does userEntry parsing and passing to function token_of
    (let ((userEntry (string (read-line)))) ;; User's entry is taken with read-line 
        (if (not (string= userEntry "quit:")) ;; If user wants to stop ":" should be entered.
            (progn ;; if not
                (let ((lookingFor #\Space)) ;; Character that we are looking for is bound to variable lookingFor
                    (let ((occurrences (find_all_occurrences lookingFor userEntry))) ;; Occurences is the list what find-all-occurences function returns
                        (let ((lenOccur (length occurrences))) ;; Variable that keeps how many lookingFor we have.
                        (let ((i 0)) ;; i is used to control substrings
                            (loop for element in occurrences
                                do(let ((sendToken (subseq userEntry i element))) ;; using subseq we are passing userEntry word by word
                                        (check_for_parenthesis sendToken)
                                        (setq i (+ 1 element))) ;; incrementing to next occurance
                            )
                        )
                        )
                    )
                )
            )
            (quit)
        )
    )
)


(defun gppinterpreter() ;; Tokenization starts here
    (format t "Enter 'quit:' to exit.~%")
    (loop
        (princ "Enter the word: ")
        (entry_parser)
    )
)
(gppinterpreter)