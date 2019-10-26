module Logger where


import Effect.Console (log)
import Effect (Effect)
import Erl.Process.Raw (Pid, receive, spawn)
import Prelude


start :: Effect Pid
start = spawn log_

log_ :: Effect Unit
log_ = (receive :: Effect String) >>= (show >>> log)
