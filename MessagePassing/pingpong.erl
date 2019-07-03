%% ---------------------------------------------------------------------
%% File: pingpong.erl

-module(pingpong).

-export([start/0, ping/2, pong/0]).

ping(N,PongPID) ->
  io:format("Hi i have recieved this N with PONG PID ~p",[N,PongPID]).

pong() ->
  io:format("Inside Pong").
%  reciece
%   io:format("recieved something"),
%  end.

start()->
  PongPid = spawn(pingpong,ping()).