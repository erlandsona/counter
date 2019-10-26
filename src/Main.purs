module Main where

import Clock as Clock
import Counter as Counter
import Console as Console
import Prelude
import Effect (Effect)

main :: Effect Unit
main = do
  repl <- Console.start
  counter <- Counter.start 0

  state1 <- Counter.state counter

  Console.log repl $ "Count is " <> show state1
  Clock.tick 1

  Counter.tick counter
  Counter.tick counter
  Counter.tick counter

  state2 <- Counter.state counter

  Console.log repl $ "Count is " <> show state2
  Clock.tick 1

  Counter.tick counter
  Counter.tick counter

  state3 <- Counter.state counter

  Console.log repl $ "Count is " <> show state3
  Clock.tick 1

  Console.log repl $ "Signing off muchachos!"

  {-- Clock.start \tick -> do --}
  {--    log $ "Hello Erlang!" <> " Woot!" <> show tick --}
