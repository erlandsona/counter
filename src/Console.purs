module Console where


import Effect.Console as C
import Effect (Effect)
import Erl.Process.Raw (Pid, receive, send, spawn)
import Prelude


start :: Effect Pid
start = spawn server

server :: Effect Unit
server = logger
    where
        logger = do
            receive >>= C.log
            logger

log :: Pid -> String -> Effect Unit
log = send
