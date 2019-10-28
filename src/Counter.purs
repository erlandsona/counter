module Counter where

import Counter.Core (Msg(..))
import Counter.Server as Server
import Effect (Effect)
import Erl.Process.Raw (receive, Pid, spawn, send)
import Prelude
import Proc (self)

start :: Int -> Effect Pid
start = spawn <<< Server.run

tick :: Pid -> Effect Unit
tick pid = send pid Tick

state :: Pid -> Effect Int
state pid = do
  me <- self
  send pid (State me)
  receive

