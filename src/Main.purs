module Main where

import Clock as Clock
import Counter as Counter
import Logger as Logger
import Prelude
import Effect (Effect)
import Erl.Process (send)

main :: Effect Unit
main = do
  loggerProc <- Logger.start

  send loggerProc "Starting at 0"

  counter <- Counter.start 0

  Clock.tick 1
  Counter.state counter loggerProc

  Counter.tick counter
  Counter.tick counter
  Counter.tick counter

  Clock.tick 1
  Counter.state counter loggerProc

  Counter.tick counter
  Counter.tick counter

  Clock.tick 1
  Counter.state counter loggerProc


  {-- Clock.start \tick -> do --}
  {--    log $ "Hello Erlang!" <> " Woot!" <> show tick --}
