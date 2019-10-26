module Main where

{-- import Clock as Clock --}
import Counter as Counter
import Logger as Logger
import Prelude
import Effect (Effect)
import Erl.Process.Raw (send)

main :: Effect Unit
main = do
  logger <- Logger.start
  _ <- send logger "Starting at 0"

  counter <- Counter.start 0

  state1 <- Counter.state counter

  {-- _ <- send logger $ "Count is " <> show state1 --}

  {-- _ <- Counter.tick counter --}
  {-- _ <- Counter.tick counter --}
  {-- _ <- Counter.tick counter --}

  {-- state2 <- Counter.state counter --}

  {-- _ <- send logger $ "Count is " <> show state2 --}

  {-- _ <- Counter.tick counter --}
  {-- _ <- Counter.tick counter --}

  {-- state3 <- Counter.state counter --}

  {-- _ <- send logger $ "Count is " <> show state3 --}

  pure unit


  {-- Clock.start \tick -> do --}
  {--    log $ "Hello Erlang!" <> " Woot!" <> show tick --}
