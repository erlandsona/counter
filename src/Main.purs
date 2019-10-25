module Main where

import Clock as Clock
import Prelude
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  Clock.start \tick -> do
     log $ "Hello Erlang!" <> " Woot!" <> show tick
