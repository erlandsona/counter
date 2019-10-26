-module(counter@foreign).

-export([self_/0]).


self_() ->
    fun() ->
        self()
    end.
