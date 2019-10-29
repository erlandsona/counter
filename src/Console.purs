module Console where


{-- import Control.Monad.Rec.Class (forever) --}
{-- import Control.Lazy (fix) --}
import Effect.Console as C
import Effect (Effect)
import Erl.Process.Raw (Pid, receive, send, spawn)
import Prelude


start :: Effect Pid
start = spawn server
{-- let loop = do this >>= \_ -> loop --}
{-- {1-- is equivalent to --1} --}
{-- fix \loop -> do this >>= \_ -> loop --}

{-- {1-- but if you want an  operator that just makes a block of code loop forever, that’s what forever is for --1} --}
{-- forever do this --}


{-- Need an instance of Fix for Effect to write this? --}
{-- server :: Effect Unit --}
{-- server = fix (\_ -> receive >>= C.log) --}

server :: Effect Unit
server = logger
  where
    logger = do
       (receive >>= C.log)
       logger

log :: Pid -> String -> Effect Unit
log = send
