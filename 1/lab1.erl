-module(lab1).
-export([main/1]).

listInit(N, N) -> [N];
listInit(X, N) -> [X | listInit(X + 1, N)].
tailFWrite(H, []) -> io:fwrite("~w\n", [H]);
tailFWrite(H, T) -> io:fwrite("~w, ", [H]), [H1 | T1] = T, tailFWrite(H1, T1).
listFWrite([]) -> tailFWrite([], []);
listFWrite([H | T]) -> tailFWrite(H, T).
listSum([]) -> 0;
listSum(L) -> [H | T] = L,
              if 
                 T == [] -> H;
                 true -> H + listSum(T)
              end.
getDividers(A, B) -> if 
                        A >= B -> [];
                        B rem A == 0 -> [A | getDividers(A + 1, B)];
                        true -> getDividers(A + 1, B)
                     end.
findDividers(X) -> getDividers(1, X).
getPerfect([]) -> [];
getPerfect([H | T]) -> S = listSum(findDividers(H)),
                       if
                          S == H -> [H | getPerfect(T)];
                          true -> getPerfect(T)
                       end.

main(N) ->
    listFWrite(getPerfect(listInit(1,N))).
