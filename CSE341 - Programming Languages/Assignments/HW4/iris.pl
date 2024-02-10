%%According to below decision tree if-else statements are written. To identify which class a query is belong to.

%Knowledge base
iris(_, SW, PL, PW, Type):- 
    (PL=< 2.45 -> 
        (Type = setosa); 
        (PW =< 1.75 ->
            (PL =< 4.95 -> 
                (PW =< 1.65 -> 
                    (Type = versicolor); 
                    (Type = virginica)
                ); 
                (PW =< 1.55 -> 
                    (Type = virginica); 
                    (PL =< 5.45 -> 
                        (Type = versicolor); 
                        (Type = virginica)        
                    )
                )
            );
            (PL =< 4.85 ->
                    (SW =< 3.10 -> 
                        (Type = virginica); 
                        (Type = versicolor)
                    );
                    (Type = virginica)
            )
        ) 
    ).

%% Rule to identify given data belongs to which class          
classify(SL, SW, PL, PW) :- iris(SL, SW, PL, PW, Type), write(Type), write("\n\n").

%%%%%%%%%%%%%%      Decision Tree    %%%%%%%%%%%%%%
/*
if petal length (cm) <= 2.45:
  return setosa
else:
  if petal width (cm) <= 1.75:
    if petal length (cm) <= 4.95:
      if petal width (cm) <= 1.65:
        return versicolor
      else:
        return virginica
    else:
      if petal width (cm) <= 1.55:
        return virginica
      else:
        if petal length (cm) <= 5.45:
          return versicolor
        else:
          return virginica
  else:
    if petal length (cm) <= 4.85:
      if sepal width (cm) <= 3.10:
        return virginica
      else:
        return versicolor
    else:
      return virginica
*/

                    

