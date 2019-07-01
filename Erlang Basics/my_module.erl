%% This is a simple Erlang module

-module(my_module).

-export([pie/0, print/1, either_or_both/2, area/1, area2/1, sign/1, yesno/1, comparingTwoNumbers/2,compareThreeNumbers/3,
  render/0, sum/1, do_sum/1, rev/1, tailrev/1, username_and_password/2, reverseList/1, reverseList/2]).


pie() ->
  3.14.


print(Term) ->
  io:format("The value of Term is: ~w.~n", [Term]).

%Following Examples will demonstrate the usage of Guards use of guards
either_or_both(true, B) when is_boolean(B) ->
  true;
either_or_both(A, true) when is_boolean(A) ->
  true;
either_or_both(false, false) ->
  false.

username_and_password(Username, Password) when is_integer(Password) orelse Password =:= Username
  ->
  io:format("invalid userName passed to system ~n");
username_and_password(_Username, _Password)
  -> io:format("Good to go ~n").
area(Shape) ->
  case Shape of
    {circle, Radius} ->
      Radius * Radius * math:pi();
    {square, Side} ->
      Side * Side;
    {rectangle, Height, Width} ->
      Height * Width
  end.
% converting area method to annonymus method

area2(A) ->
  case is_list(A) of
    true ->
      io:format("A is a list"),
      B = lists:foldl(fun(V) -> V * V end, 0, A),
      io:formaat("Output list is  ~p", B);

    _ -> error
  end.





sign(N) when is_number(N) ->
  if
    N > 0 -> positive;
    N < 0 -> negative;
    true -> zero
  end.
% using if else to compare two numbers
comparingTwoNumbers(M, N) when is_number(N), is_number(M) ->
  if
    M > N -> io:format("Greater is ~p ~n",[M]);
    N > M -> io:format("Greater is ~p ~n",[N])
  end;

comparingTwoNumbers(M, M) when is_number(M) ->
  both_numbers_are_same.

compareThreeNumbers(A, A, A) when is_number(A) ->
  all_three_Are_Same;

compareThreeNumbers(A, B, C) when is_number(A), is_number(B), is_number(C) ->
  if A > B -> comparingTwoNumbers(A,C);
     B > A -> comparingTwoNumbers(B,C);
     A =:= B -> comparingTwoNumbers(A,C)
  end.


yesno(F) ->
  case F(true, false) of
    true -> io:format("yes~n");
    false -> io:format("no~n");
    _ -> io:format("invalid input u have passed")
  end.


to_html(Items, F) ->
  ["<dl>\n",
    [io_lib:format("<dt>~s:\n<dd>~s\n", [F(T), F(D)]) || {T, D} <- Items],
    "</dl>"
  ].

render(Items, Em) ->
  to_html(Items,
    fun(Text) ->
      "<" ++ Em ++ ">" ++ Text ++ "</" ++ Em ++ ">"
    end).

render() ->
  render([{"D&D", "Dungeons and Dragons"}], "b").


sum(0) -> 0;
sum(N) -> sum(N - 1) + N.


do_sum(N) -> do_sum(N, 0).

do_sum(0, Total) -> Total;
do_sum(N, Total) -> do_sum(N - 1, Total + N).


rev([X | TheRest]) -> rev(TheRest) ++ [X];
rev([]) -> [].


reverseList([]) -> emptyListPassed;
reverseList(List) -> reverseList(List, []).
reverseList([Head | Tail], Accumulator) -> reverseList(Tail, [Head | Accumulator]);
reverseList([], List) -> List.



tailrev(List) -> tailrev(List, []).

tailrev([X | TheRest], Acc) -> tailrev(TheRest, [X | Acc]);
tailrev([], Acc) -> Acc.
