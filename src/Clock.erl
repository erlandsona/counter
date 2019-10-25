-module(clock@foreign).

-export([sleep/1]).


sleep(Milliseconds) ->
    fun() ->
        timer:sleep(Milliseconds)
    end.
