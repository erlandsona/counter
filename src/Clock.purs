module Clock where

import Counter.Core (inc)
import Effect (Effect)
import Prelude

start :: (Int -> Effect Unit) -> Effect Unit
start = run 0


run :: Int -> (Int -> Effect Unit) -> Effect Unit
run count f = do
  _ <- f count
  _ <- sleep 1000
  result <- run (inc count) f
  pure unit


foreign import sleep :: Int -> Effect Unit
