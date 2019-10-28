module Clock where

import Counter.Core (inc)
import Effect (Effect)
import Prelude

start :: (Int -> Effect Unit) -> Effect Unit
start = run 0

run :: Int -> (Int -> Effect Unit) -> Effect Unit
run count f = do
  f count
  sleep 1000
  run (inc count) f


foreign import sleep :: Int -> Effect Unit

tick :: Int -> Effect Unit
tick int = sleep $ 1000 * int
