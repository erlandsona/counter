module Counter where

import Counter.Core (Msg(..), Count(..))
import Counter.Server as Server
import Effect (Effect)
import Erl.Process.Raw (receive, Pid, spawn, send)
import Prelude

start :: Int -> Effect Pid
start init = spawn (pure unit <* Server.run init)

tick :: Pid -> Effect Unit
tick pid = send pid Tick

state :: Pid -> Effect Int
state pid =
  send pid (State self_)
  *> (receive :: Effect Count)
  >>= case _ of
    Count v -> pure v


foreign import self_ :: Pid
