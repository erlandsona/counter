module Counter (Msg, start, tick, state) where

import Counter.Core (inc)
import Effect (Effect)
import Erl.Process (Process, spawn, send)
import Prelude

-- Msg is opaque!
data Msg
  = Tick
  | Total (Process String)


start :: Int -> Effect (Process Msg)
start int = spawn $ server int


server :: Int -> Effect Msg -> Effect Unit
server int receive = counter int
    where
        counter count =
            receive >>= case _ of
                Tick ->
                  counter (inc count)

                Total proc -> do
                  send proc (show count)
                  counter count


tick :: Process Msg -> Effect Unit
tick pid = send pid Tick

state :: Process Msg -> Process String -> Effect Unit
state counter sender = send counter (Total sender)
