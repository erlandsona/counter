module Logger where


import Effect.Console (log)
import Effect (Effect)
import Erl.Process (Process, spawn)
import Prelude


start :: Effect (Process String)
start = spawn server

server :: Effect String -> Effect Unit
server receive = logger
    where
        logger = do
            receive >>= log
            logger
